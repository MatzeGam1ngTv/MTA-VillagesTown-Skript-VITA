﻿--[[
Project: VitaOnline
File: admin-server.lua
Author(s):	Golf_R32
			CubedDeath
			Sebihunter
]]--


g_FreeMode = false
atimer = {}
a1timer = {}


function getPlayerUserFileData(playername, key)
	local result = nil
	if playername ~= nil and playername ~= "" and key ~= nil and key ~= "" then
	
		if mysql_ping ( g_mysql["connection"] ) == false then
			onResourceStopMysqlEnd()
			onResourceStartMysqlConnection()
		end	

		local query = mysql_query(g_mysql["connection"],"SELECT * FROM users WHERE name = '"..playername.."';")
		if query and mysql_num_rows(query) > 0 then
			local row = mysql_fetch_assoc(query)
			result = row[tostring(key)]
		end
	end
	return result
end

function setPlayerUserFileData(playername, key, params)
	if playername ~= nil and playername ~= "" and key ~= nil and key ~= "" then
		local player = getPlayerFromName(playername)
		
		if mysql_ping ( g_mysql["connection"] ) == false then
			onResourceStopMysqlEnd()
			onResourceStartMysqlConnection()
		end	
		
		local query = mysql_query(g_mysql["connection"],"SELECT * FROM users WHERE name = '"..playername.."';")
		if query and mysql_num_rows(query) > 0 then
			local sql = "UPDATE `users` SET `"..key.."` = '"..params.."'\
													WHERE `name` = '"..playername.."';"
			mysql_query(g_mysql["connection"], sql)
			sql = nil
			if player then
				if key == "admin" then
					setElementData(player, "getPlayerSpecialRights", params)
				elseif key == "aktivated" then
					setElementData(player, "playerRegisterStatus", params)
				elseif key ~= "time" then
					setElementData(player, key, params)
				elseif key == "job" then
					if tonumber(params) == 0 then
						setPlayerTeam(player, nil)
					else
						setPlayerTeam(player, gJobTeams[tonumber(params)])
					end
				end
			end		
		end
		mysql_free_result(query)
	end
end
addEvent("setPlayerUserFileData",true)
addEventHandler("setPlayerUserFileData", getRootElement(), setPlayerUserFileData)


function getXMLRPGPlayerToRegister(source)
		theRPGPlayerSettings = {}
		if mysql_ping ( g_mysql["connection"] ) == false then
			onResourceStopMysqlEnd()
			hasPlayersLoaded = false
			onResourceStartMysqlConnection()
		end	
		local i = 1
		
		local result = mysql_query(g_mysql["connection"], "SELECT * FROM `users` ORDER BY `id` ASC")
		if result then
			while true do
				local row = mysql_fetch_assoc(result)
				if not row then break end
					
				theRPGPlayerSettings[i] = {}
				theRPGPlayerSettings[i]["name"] = row["name"]
				theRPGPlayerSettings[i]["activ"] = row["aktivated"]
				theRPGPlayerSettings[i]["erstellt"] = row["erstellt"]
				theRPGPlayerSettings[i]["laston"] = row["laston"]
				theRPGPlayerSettings[i]["skin"] = row["skin"]
				theRPGPlayerSettings[i]["admin"] = row["admin"]
				theRPGPlayerSettings[i]["geschlecht"] = row["geschlecht"]
				theRPGPlayerSettings[i]["birth"] = row["geb"]
				theRPGPlayerSettings[i]["job"] = row["job"]
				theRPGPlayerSettings[i]["rank"] = row["rank"]
				theRPGPlayerSettings[i]["rang"] = row["rang"]
				theRPGPlayerSettings[i]["money"] = row["geld"]		
				i = i+1
			end
			mysql_free_result(result)
			triggerLatentClientEvent(source, "onRPGPlayerGetStats", 500000, false,source,theRPGPlayerSettings)			
		end
end
addEvent("getRPGPlayersToRegister",true)
addEventHandler("getRPGPlayersToRegister",getRootElement(),getXMLRPGPlayerToRegister)



function toggleAdminPanel(source, key, state)
	if state ~= "down" then return end
	if getElementData(source, "isPlayerLoggedIn") == true then
		--getRPGPlayerRights(source)
		if tonumber(getElementData(source, "getPlayerSpecialRights")) >= 1 then
			getXMLRPGPlayerToRegister(source)
			triggerClientEvent("showTheAdminPlayerUserMenu",source)
		end
	end
end

function deleteRPGPlayer(name)
		for i = 1,#theRPGPlayerSettings do
			theRPGPlayerSettings[i]["activ"] = {}
			theRPGPlayerSettings[i]["name"] = {}
			theRPGPlayerSettings[i]["skin"] = {}
			theRPGPlayerSettings[i]["geschlecht"] = {}
			theRPGPlayerSettings[i]["birth"] = {}
			theRPGPlayerSettings[i]["admin"] = {}
			theRPGPlayerSettings[i]["job"] = {}
			theRPGPlayerSettings[i]["rank"] = {}
			theRPGPlayerSettings[i]["erstellt"] = {}
			theRPGPlayerSettings[i]["laston"] = {}
		end

		if mysql_ping ( g_mysql["connection"] ) == false then
			onResourceStopMysqlEnd()
			hasPlayersLoaded = false
			onResourceStartMysqlConnection()
		end			
		
		local query = mysql_query(g_mysql["connection"],"SELECT * FROM users WHERE name = '"..playername.."';")
		if query and mysql_num_rows(query) > 0 then
			mysql_query(g_mysql["connection"], "DELETE FROM `users` WHERE name = `"..playername.."`")
			for _, vehicle in ipairs(getElementsByType("fakeVehicle")) do
				if getElementData ( vehicle, "owner" ) == tostring(name) then
					destroyElement(vehicle)
				end
			end
			for _, vehicle in ipairs(getElementsByType("vehicle")) do
				if getElementData ( vehicle, "owner" ) == tostring(name)  then
					destroyElement(vehicle)
				end
			end
			for _, vehicle in ipairs(getElementsByType("fakeVehicle")) do
				if getElementData ( vehicle, "owner" ) == tostring(name)  then
					destroyElement(vehicle)
				end
			end			
			for _, house in ipairs(getElementsByType("pickup")) do
				if getElementData(house, "intType") == 1 then
					if getElementData(house, "owner") == tostring(name) then
						setElementData(house, "owner", "Niemand")
						setElementData(house, "keys", "Niemand")
						refreshHousePickup(house)
					elseif getElementData(house, "owner") == "Staatsbeamter" and getElementData(house, "keys") == tostring(name) then
						setElementData(house, "owner", "Niemand")
						setElementData(house, "keys", "Niemand")
						refreshHousePickup(house)
					end
				end
			end	
			deleteBankAccount(tostring(name))			
		end

		local theplayer = getPlayerFromName(name)
		if theplayer then
			--removeElementData(theplayer, "playerRegisterStatus")
			setElementAlpha(theplayer,0)
			triggerClientEvent("redoTheLoginScreen", theplayer)
			setElementData(theplayer, "isPlayerLoggedIn", false)
			--isRPGPlayerRegistered(theplayer)
		end
		if source == theplayer then
			--getRPGPlayerRights(theplayer)
			if tonumber(getElementData(theplayer, "getPlayerSpecialRights")) >= 1 then
				getXMLRPGPlayerToRegister(theplayer)
				triggerClientEvent("showTheAdminPlayerUserMenu",theplayer)
			end
		end
		xmlSaveFile(xml)
		xmlUnloadFile(xml)
		getXMLRPGPlayerToRegister(source)
end
addEvent("loescheRPGPlayer", true)
addEventHandler("loescheRPGPlayer", getRootElement(), deleteRPGPlayer)


function sendSupportMessage(message,player)
	local ply = getPlayerFromName(player)
	if ply then
		triggerClientEvent ( ply, "showTutorialMessage", getRootElement(), "support",  "Supportnachricht von "..getPlayerName(source)..":\n"..message, false, true )		
	end
end
addEvent("sendSupportMessage", true)
addEventHandler("sendSupportMessage", getRootElement(), sendSupportMessage)

function toggleFreemode(source,state)
	g_FreeMode = state
end
addEvent("toggleFreemode", true)
addEventHandler("toggleFreemode", getRootElement(), toggleFreemode)

function isFreemodeEnabled()
	if g_FreeMode == true then
		return g_FreeMode
	end
end
addEvent("isFreemodeEnabled", true)
addEventHandler("isFreemodeEnabled", getRootElement(), isFreemodeEnabled)

addCommandHandler("aircars", 
	function(source)
		if getElementData(source, "aircars") == true then
			triggerClientEvent(source, "aircars", source, false)
			outputChatBox("Aircars deaktiviert!", source, 255, 255, 255)
			setElementData(source, "aircars", false)
		else
			triggerClientEvent(source, "aircars", source, true)
			outputChatBox("Aircars aktiviert!", source, 255, 255, 255)
			setElementData(source, "aircars", true)
		end
	end
, true, false)

function Adminlicht( player )
	local veha = getPedOccupiedVehicle ( player )
	local model = getElementModel ( veha )
	if model ~= 523 and model ~= 462 and model ~= 448 and model ~= 581 and model ~= 522 and model ~= 461 and model ~= 521 and model ~= 463 and model ~= 586 and model ~= 468 and model ~= 471 then
		if isPedInVehicle ( player )  then
			if getElementData ( veha, "Adminlicht" ) and isTimer(getElementData ( veha, "Adminlicht" )) then
				killTimer ( atimer[veha] )
				setVehicleHeadLightColor ( veha, 0, 0, 0 )
				setVehicleLightState ( veha, 0,  0 )
				setVehicleLightState ( veha, 1,  0 )
				setVehicleOverrideLights ( veha, 1 )
			else
				setVehicleHeadLightColor ( veha, 0, 255, 0 )
				setVehicleOverrideLights ( veha, 2 )
				atimer[veha] = setTimer ( function () setVehicleLightState ( veha, 0, 1 ) setVehicleLightState ( veha, 1, 0 )
				if isElement ( veha ) == false or isElement ( veha ) == nil then
					killTimer ( atimer[veha] )
				end
				setTimer ( function () setVehicleHeadLightColor ( veha, 0, 255, 0 ) setVehicleLightState ( veha, 0, 0 ) setVehicleLightState ( veha, 1, 1 ) end, 250, 1, veha ) end, 500, 0 , veha )
				setElementData ( veha, "Adminlicht", atimer[veha] )
			end
		end
	else
		if getElementData ( veha, "Adminlicht" ) and isTimer(getElementData ( veha, "Adminlicht" )) then
			killTimer ( a1timer )
			setVehicleHeadLightColor ( veha, 0, 0, 0 )
		else
			setVehicleHeadLightColor ( veha, 0, 255, 0 )
			a1timer = setTimer ( function () setVehicleOverrideLights ( veha, 2 )
			if isElement ( veha ) == false or isElement ( veha ) == nil then
				killTimer ( a1timer )
			end
			setTimer ( function () setVehicleHeadLightColor ( veha, 0, 255, 0 ) setVehicleOverrideLights ( veha, 1 ) end, 500, 1, veha ) end, 1000, 0 , veha )
			setElementData ( veha, "Adminlicht", a1timer )
		end
	end	
end
addCommandHandler ( "adminlicht", Adminlicht, true, false )

function renamePlayer(source, commandName, playername, newname)
	if getElementData(source, "getPlayerSpecialRights") < 1 then return false end
	local isOnline = false
	for i,e in ipairs(getElementsByType("player")) do
		if e then
			if getPlayerName(e) == playername then
				isOnline = true
			end
		end
	end
	if isOnline == false then
		setPlayerUserFileData(playername, "name", newname)
		local acc = getBankAccount(playername)
		if acc then
			local accmoney = getBankAccountMoney(acc)
			acc = createBankAccount(newname, 0, 0)
			systemDeposit(acc, accmoney, "Account Rename")
			deleteBankAccount(playername)
		end
		
		for _, house in ipairs(getElementsByType("pickup")) do
			if getElementData(house, "intType") == 1 then
				if getElementData(house, "owner") == playername then
					setElementData(house, "owner", newname)
				end
				if string.find(getElementData(house, "keys"), playername) then
					local keys = getElementData(house, "keys")
					keys = string.gsub(keys, playername, newname)
					setElementData(house, "keys", keys)
				end		
			end
		end		
		for _, akte in ipairs(getElementsByType("wanted")) do
			if getElementData(akte, "name") == playername then
				setElementData(akte, "name", newname)
			end
		end

		for _, vehicle in ipairs(getElementsByType("vehicle")) do
			if getElementData(vehicle, "owner") == playername then
				setElementData(vehicle, "owner", newname)
			end
			if string.find(getElementData(vehicle, "keys"), playername) then
				local keys = getElementData(vehicle, "keys")
				keys = string.gsub(keys, playername, newname)
				setElementData(vehicle, "keys", keys)
			end		
		end
		for _, vehicle in ipairs(getElementsByType("fakeVehicle")) do
			if getElementData(vehicle, "owner") == playername then
				setElementData(vehicle, "owner", newname)
			end
			if string.find(getElementData(vehicle, "keys"), playername) then
				local keys = getElementData(vehicle, "keys")
				keys = string.gsub(keys, playername, newname)
				setElementData(vehicle, "keys", keys)
			end		
		end		
		outputChatBox("Spieler "..playername.." erfolgreich in "..newname.." umbenannt!", source, 0, 255, 0)
	else
		outputChatBox("Error: Spieler "..playername.." konnte nicht umbenannt werden, da er online ist!", source, 255, 0, 0)
	end
end
addCommandHandler("rename", renamePlayer, false, false)

addCommandHandler("givegang",
	function(player,cmd, amount)
		if getElementData(player, "getPlayerSpecialRights") == 2 then
			setElementData(player,"gang",tonumber(amount))
			setElementData (player, "gangrank",2)
			outputChatBox ("Du bist jetzt erfolgreich in einer Gang: "..tostring(getElementData(player,"gang")), player, 0, 255, 0)
		end
	end	
)