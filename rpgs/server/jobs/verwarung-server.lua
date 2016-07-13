﻿--[[
Project: VitaOnline
File: verwarung-server.lua
Author(s):	Sebihunter
]]--
verwarungpickup = createPickup ( 1647.2, -1521.9, 13.6, 3, 1277, 0 )
verwarungsstelle = createMarker ( 1643.2, -1515.9, 12.1, "cylinder", 4, 255, 255, 255, 150 )

function useVerwarungPickup ( thePlayer )
    callClientFunction(thePlayer, "showVerwarung")
end
addEventHandler ( "onPickupUse", verwarungpickup, useVerwarungPickup )

function inVerwarungsZone(player)
	if  (getElementData(player, "job") == 6 or getElementData(player, "job") == 4) and getElementData(player, "dienst") == 1 then
		if isPedInVehicle ( player ) then
			outputChatBox("Du kannst dieses Fahrzeug mit /verwahrung in die Verwahrungsstelle bringen.", player, 125, 125, 125)
		end
	end	
end
addEventHandler("onMarkerHit", verwarungsstelle, inVerwarungsZone)

function buyVehicleBack( model, x, y, z , rz, color, health, panne, km, fuel, oil, battery, water, keys, owner, eingepackt, vstatus, preis, paintjob, var1, var2, mysqlID, upgrade, damage, doors, wheels, lights, tuev, tuevpreis, herstelldatum, inventory )
	local veh = createRPGVehicle(model,x,y,z,rz,owner,color,false,false)
	setElementData(veh, "health", health)
	if panne == "true" or panne == true then
		setElementData(veh, "panne", true)
	else
		setElementData(veh, "false", true)
	end
	setElementData(veh, "km", km)
	setElementData(veh, "fuel", fuel)
	setElementData(veh, "oil", oil)
	setElementData(veh, "battery", battery)
	setElementData(veh, "water", water)
	setElementData(veh, "keys", tostring(keys))
	setElementData(veh, "owner", tostring(owner))
	setElementData(veh, "eingepackt", false)
	setElementData(veh, "vstatus", vstatus)
	setElementData(veh, "preis", preis)
	setElementData(veh, "mysqlID", mysqlID)
	setElementData(veh, "tuev", tuev)
	setElementData(veh, "inventory", inventory)
	setElementData(veh, "tuevpreis", tuevpreis)
	setElementData(veh, "vzeit", getRealTime().timestamp)
	if herstelldatum and herstelldatum ~= "nil" and herstelldatum ~= "false" then
		setElementData(veh, "herstelldatum", herstelldatum)
	end
	setElementData(veh, "isVehicleTemp", false)
	setVehicleColor ( veh ,color[1][1], color[1][2],color[1][3],color[2][1], color[2][2],color[2][3],color[3][1], color[3][2],color[3][3],color[4][1], color[4][2],color[4][3])
	for i,v in ipairs(damage) do
		setVehiclePanelState(veh, i-1, tonumber(v))
	end
	for i,v in ipairs(upgrade) do
		addVehicleUpgrade(veh, tonumber(v) )
	end
	for i,v in ipairs(doors) do 
		setVehicleDoorState( veh, i-1, tonumber(v))
	end
	for i,v in ipairs(wheels) do 
		setVehicleDoorState( veh, i-1, tonumber(v))
	end				
	setVehicleWheelStates( veh, tonumber(wheels[1]),tonumber(wheels[2]),tonumber(wheels[3]),tonumber(wheels[4]))
	toggleVehicleRespawn( veh, false )
	for i,v in ipairs(lights) do
		setVehicleLightState (veh, i-1, tonumber(v))
	end	
	if var1 and var2 then
		setVehicleVariant(veh, var1, var2)
	end
	if paintjob then
		setVehiclePaintjob(veh, paintjob)
	end
end

function verwareFahrzeug(thePlayer, command)
		if isPedInVehicle ( thePlayer ) and ((getElementData(thePlayer, "job") == 6 and getElementData(getPedOccupiedVehicle(thePlayer), "marked") == true)  or  (getElementData(thePlayer, "job") == 4)) and getElementData(thePlayer, "dienst") == 1  then
			if isElementWithinMarker(thePlayer,verwarungsstelle) or getPlayerName(thePlayer) == "Matze.Gamingtv" or getPlayerName(thePlayer) == "Ben.Akaisda" then
				local oldveh = getPedOccupiedVehicle ( thePlayer )
				local x,y,z = getElementPosition(thePlayer)
				removePedFromVehicle ( thePlayer )
				setElementFrozen(thePlayer, true)
				local r1,g1,b1,r2,g2,b2,r3,g3,b3,r4,g4,b4 = getVehicleColor ( oldveh,true )
				local color = {{r1,g1,b1}, {r2,g2,b2}, {r3,g3,b3},{r4,g4,b4}}
				local var1, var2 = getVehicleVariant( oldveh )
				veh = createElement ( "fakeVehicle" )
				setElementData(veh, "model", getElementData(oldveh, "model"))
				setElementData(veh, "x", 1652.5 )
				setElementData(veh, "y", -1505.5 )
				setElementData(veh, "z", 13.5)
				setElementData(veh, "rx", 0)
				setElementData(veh, "ry", 0)
				setElementData(veh, "rz", 0)
				setElementData(veh, "color", color)
				setElementData(veh, "marked", false)
				setElementData(veh, "health", getElementHealth(oldveh))
				setElementData(veh, "mysqlID", getElementData(oldveh, "mysqlID"))
				setElementData(veh, "panne", getElementData(oldveh, "panne"))
				setElementData(veh, "km", getElementData(oldveh, "km"))
				setElementData(veh, "fuel", getElementData(oldveh, "fuel"))
				setElementData(veh, "oil", getElementData(oldveh, "oil"))
				setElementData(veh, "var1", var1)
				setElementData(veh, "var2", var2)
				setElementData(veh, "battery", getElementData(oldveh, "battery"))
				setElementData(veh, "water", getElementData(oldveh, "water"))
				setElementData(veh, "locked", getElementData(oldveh, "locked"))
				setElementData(veh, "keys", tostring(getElementData(oldveh, "keys")))
				setElementData(veh, "owner", tostring(getElementData(oldveh, "owner")))
				setElementData(veh, "eingepackt", getElementData(oldveh, "eingepackt"))
				setElementData(veh, "vstatus", getElementData(oldveh, "vstatus"))
				setElementData(veh, "preis", getElementData(oldveh, "preis"))
				setElementData(veh, "paintjob", getVehiclePaintjob (oldveh))	
				setElementData(veh, "tuev", getElementData(oldveh, "tuev"))	
				setElementData(veh, "herstelldatum", getElementData(oldveh, "herstelldatum"))	
				setElementData(veh, "tuevpreis", getElementData(oldveh, "tuevpreis"))	
				setElementData(veh, "inventory", getElementData(oldveh, "inventory"))	
				setElementData(veh, "vzeit", getElementData(oldveh, "vzeit"))	
				setElementData(veh, "inVerwarung", true)	
				
				local myUpgrade = {}
				for i=1, 17 do
					local upgrade = getVehicleUpgradeOnSlot ( oldveh, i-1 )
					if ( upgrade ) then
						myUpgrade[i] = upgrade
					else
						myUpgrade[i] = false
					end
				end		
				myUpgrade = myUpgrade
				
				local myDamage = {}
				for i = 1,7 do
					myDamage[i] = getVehiclePanelState ( oldveh, i-1 )
				end
				myDamage = myDamage
				
				local myDoors = {}
				for i = 1,6 do
					myDoors[i] = getVehicleDoorState ( oldveh, i-1 )
				end
				myDoors = myDoors
				
				local myWheels = {}
				local w1,w2,w3,w4 = getVehicleWheelStates ( oldveh )
				myWheels[1] = w1
				myWheels[2] = w2
				myWheels[3] = w3
				myWheels[4] = w4
				myWheels = myWheels

				local myLights = {}
				for i = 1,4 do
					myLights[i] = getVehicleLightState ( oldveh, i-1 )
				end
				myLights = myLights			
				setElementData(veh, "upgrade", myUpgrade)
				setElementData(veh, "damage", myDamage)
				setElementData(veh, "doors", myDoors)
				setElementData(veh, "wheels", myWheels)
				setElementData(veh, "lights", myLights)
				
				outputChatBox("Fahrzeug erfolgreich verwahrt! Du hast 500 Vero und 20 EXP bekommen.", thePlayer, 0, 255, 0)
				pLogger["verwarung"]:addEntry(getPlayerName(thePlayer).." hat einen "..getVehicleNameFromModel(getElementModel(oldveh)).." (ID:"..tostring(getElementData(oldveh, "model"))..") von "..tostring(getElementData(oldveh, "owner")).." zur Verwahrungsstelle gebracht.")
				_destroyElement(oldveh)
				
				--TESTFIX FÜR SPIELER VLL UNSICHTBAR NACH EINLAGERN
				setTimer(function(thePlayer,x,y,z)
					setElementPosition(thePlayer,x,y,z)
					setElementFrozen(thePlayer, false)
					setElementDimension(thePlayer, 0)
					setElementInterior(thePlayer, 0)
				end, 2000, 1, thePlayer, x,y,z)
				--
				setElementData(thePlayer, "einnahmen", getElementData(thePlayer, "einnahmen")+500)
				setElementData(thePlayer, "einnahmen2", getElementData(thePlayer, "einnahmen2")+500)	
				setElementData(thePlayer, "exp", getElementData(thePlayer, "exp")+20)	
				givePlayerMoneyEx(thePlayer, 500)
				
				systemDeposit("Autofix", 500) -- AutoFix bekommt 200 für Autoverwarung
				systemDeposit("Polizei", 500) -- Polizei bekommt 200 für Autoverwarung
			end
		end
end	
addCommandHandler("verwahrung", verwareFahrzeug)	

function openVehicle(thePlayer, command)
	if getElementData(thePlayer, "job") == 4 then
		local posX, posY, posZ = getElementPosition( thePlayer )
		local chatSphere = createColSphere( posX, posY, posZ, 5 )
		local nearbyVehicles = getElementsWithinColShape( chatSphere, "vehicle" )
		destroyElement( chatSphere )
		outputChatBox("Fahrzeug für 5 Sekunden aufgesperrt...",thePlayer,0,255,0)
		for index, veh in ipairs( nearbyVehicles ) do
			if isVehicleLocked(veh) == true then
				setVehicleLocked ( veh, false )
				setTimer(
					function()
						setVehicleLocked ( veh, true )
					end
				,5000,1, blip)	
			end
		end
	end
end
addCommandHandler("öffneauto", openVehicle)	
addCommandHandler("oeffneauto", openVehicle)	

function markVehicle(thePlayer, command, ttime)
	if (getElementData(thePlayer, "job") == 6 or getElementData(thePlayer, "job") == 3) and isPedInVehicle ( thePlayer ) then
		local veh = getPedOccupiedVehicle ( thePlayer )
		if getElementData(veh, "marked") == true then
			outputChatBox("Abschleppmarkierung gelöscht und Radkrallen entfernt.",thePlayer,0,255,0)
			setElementFrozen(veh, false)
			setVehicleDamageProof(veh, false)
			setElementData(veh, "marked", false)
			setElementData(veh, "vzeit", getRealTime().timestamp-1)
		else	
			outputChatBox("Auto zum abschleppen markiert und Radkrallen wurden angelegt.",thePlayer,0,255,0)
			setElementData(veh, "marked", true)
			setVehicleDamageProof(veh, true)
			setElementFrozen(veh, true)
			if ttime and tonumber(ttime) then
				setElementData(veh, "vzeit", getRealTime().timestamp+86400*tonumber(ttime))
				outputChatBox("Das Fahrzeug kann erst in "..ttime.." Tagen vom Besitzer ausgelöst werden.",thePlayer,0,255,0)
			else
				setElementData(veh, "vzeit", getRealTime().timestamp-1)
			end
		end	
	end
end
addCommandHandler("falschparker", markVehicle)	