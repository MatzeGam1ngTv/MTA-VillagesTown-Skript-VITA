--[[
Project: VitaOnline
File: mower-client.lua
Author(s):	Golf_R32
			Sebihunter
]]--

local tourVehicle = false
local cooldown = false

local theMissiMowerMarker = {}
function starttheMowermarker()
		theMissiMowerMarkerMain = createMarker ( 930.7, -1111.4, 23.2, "cylinder", 3, 245, 158, 9, 255 )
		theMissiMowerMarker[1] = createMarker ( 913.5, -1085.2, 23.2, "cylinder", 1.5, 245, 158, 9, 0 )
		theMissiMowerMarker[2] = createMarker ( 853.5, -1090.9, 23.2, "cylinder", 1.5, 245, 158, 9, 0 )
		theMissiMowerMarker[3] = createMarker ( 898.8, -1059.2, 23.2, "cylinder", 1.5, 245, 158, 9, 0 )
		theMissiMowerMarker[4] = createMarker ( 880.5, -1081.9, 23.2, "cylinder", 1.5, 245, 158, 9, 0 )
		theMissiMowerMarker[5] = createMarker ( 932.8, -1094.9, 23.2, "cylinder", 1.5, 245, 158, 9, 0 )
		theMissiMowerMarker[6] = createMarker ( 884.3, -1125.7, 23.2, "cylinder", 1.5, 245, 158, 9, 0 )
		theMissiMowerMarker[7] = createMarker ( 842.0, -1108.4, 23.2, "cylinder", 1.5, 245, 158, 9, 0 )
		theMissiMowerMarker[8] = createMarker ( 858.5, -1126.4, 23.2, "cylinder", 1.5, 245, 158, 9, 0 )
		theMissiMowerMarker[9] = createMarker ( 867.3, -1107.7, 23.2, "cylinder", 1.5, 245, 158, 9, 0 )
		theMissiMowerMarker[10] = createMarker( 910.8, -1118.2, 23.2, "cylinder", 1.5, 245, 158, 9, 0 )
		for i = 1,#theMissiMowerMarker do
			if isElement(theMissiMowerMarker[i]) then
				setElementDimension(theMissiMowerMarker[i], 1234)
			end
		end
		addEventHandler("onClientMarkerHit", theMissiMowerMarkerMain,startminimission)
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), starttheMowermarker)

local theminiMowermissiontext = ""
local neuesgeldblub = 0
local erreichteziele = 0
function startmissi ()
	local x,y = guiGetScreenSize()

	dxDrawText(theminiMowermissiontext, 5,0,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiMowermissiontext, 0,5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiMowermissiontext, 0,-5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiMowermissiontext, -5,0,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)

	dxDrawText(theminiMowermissiontext, 5,5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiMowermissiontext, -5,5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiMowermissiontext, 5,-5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiMowermissiontext, -5,-5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)

	dxDrawText(theminiMowermissiontext, 0,0,x,y*0.25,tocolor(255,100,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
end
setElementData(getLocalPlayer(), "isMiniMissionActivated", false)

function startminimission(player)
	if getLocalPlayer() == player then
		veh = getPedOccupiedVehicle(player)
		if not veh then addNotification(1, 255, 0, 0, "Du kannst den Minijob nur in einem 'Mower' beginnen.") return end
		if cooldown == true then return end
		if getElementData(getLocalPlayer(), "dienst") == 1 then addNotification(1, 255, 0, 0, "Du kannst keinen Nebenjob beginnen\nwenn du im Dienst bist.") return end
		if veh then
			if getVehicleOccupant(veh) == getLocalPlayer() then
				if getVehicleName(veh) ==  "Mower" then
				if getElementData(getLocalPlayer(), "isMiniMissionActivatedMower") ~= true then
					if getElementData(getLocalPlayer(), "isMiniMissionActivated") == false then
							if killermission and isTimer(killermission) then killTimer(killermission) end
							if isTimer(theverdienstgeldtimer) then killTimer(theverdienstgeldtimer) end
							neuesgeldblub = 0
							addEventHandler("onClientRender", getRootElement(), startmissi)
							theminiMowermissiontext = "Mähvorgang wurde gestartet!"
							showTutorialMessage("mower_1", "Zum Mähen musst du den Checkpoint am Friedhof erreichen. Du kannst den Job am Startpunkt jederzeit beenden.")
							tourVehicle = veh
							setElementData(getLocalPlayer(), "isMiniMissionActivated", true)
							showPlayerHudComponent ( "radar", true )
							thebishergestartedtimer = setTimer(
														function()
															theminiMowermissiontext = "Bisher erreichte Checkpoints: "..erreichteziele
														end
														,3000,1)
							damarkerdenduhittenmsusst = math.random(1,#theMissiMowerMarker)
							setMarkerColor(theMissiMowerMarker[damarkerdenduhittenmsusst], 95, 255, 0,100)
							setElementDimension(theMissiMowerMarker[damarkerdenduhittenmsusst], 0)
							theMowermissionblip = createBlip(getElementPosition(theMissiMowerMarker[damarkerdenduhittenmsusst]))
							addEventHandler("onClientMarkerHit", theMissiMowerMarker[damarkerdenduhittenmsusst], markerhitofitititi)
						elseif getElementData(getLocalPlayer(), "isMiniMissionActivated") == "neuensuchen" then
							if isTimer(theverdienstgeldtimer) then killTimer(theverdienstgeldtimer) end
							setElementData(getLocalPlayer(), "isMiniMissionActivated", true)
							damarkerdenduhittenmsusst = math.random(1,#theMissiMowerMarker)
							setMarkerColor(theMissiMowerMarker[damarkerdenduhittenmsusst], 95, 255, 0,100)
							setElementDimension(theMissiMowerMarker[damarkerdenduhittenmsusst], 0)
							theMowermissionblip = createBlip(getElementPosition(theMissiMowerMarker[damarkerdenduhittenmsusst]))
							addEventHandler("onClientMarkerHit", theMissiMowerMarker[damarkerdenduhittenmsusst], markerhitofitititi)
						else
							if isTimer(thebishergestartedtimer) then killTimer(thebishergestartedtimer) end
								setElementData(getLocalPlayer(), "isMiniMissionActivated", false)
								theminiMowermissiontext = "Mähvorgang wurde abgebrochen!"
								if killermission and isTimer(killermission) then killTimer(killermission) end
								destroyElement(theMowermissionblip)
								setMarkerColor(theMissiMowerMarker[damarkerdenduhittenmsusst], 95, 255, 0,0)
								setElementDimension(theMissiMowerMarker[damarkerdenduhittenmsusst], 1234)
								removeEventHandler("onClientMarkerHit", theMissiMowerMarker[damarkerdenduhittenmsusst], markerhitofitititi)
								cooldown = true
								setTimer(function() cooldown = false end, 15000, 1)
								theverdienstgeldtimer = setTimer(
								function()
									neuesgeldblub = math.floor(neuesgeldblub)
									theminiMowermissiontext = "Du hast "..neuesgeldblub.. " Vero verdient!"
									triggerServerEvent("giveTheMiniMissionPrize", getLocalPlayer(),getLocalPlayer(), neuesgeldblub)
									erreichteziele = 0
									showPlayerHudComponent ( "radar", false )
									theverdienstgeldtimer = setTimer(function() theminiMowermissiontext = ""  neuesgeldblub = 0 removeEventHandler("onClientRender", getRootElement(), startmissi)  end , 2000,1)
								end
								,3000,1)
			
					end
					end
								else
				theminiMowermissiontext = "Du brauchst einen 'Mower' um diesen Friedhof zu mähen!"
				if isTimer(theshitcarisfalschtimer) then
					killTimer(theshitcarisfalschtimer)
				end
				theshitcarisfalschtimer = setTimer(
				function()
					theminiMowermissiontext = ""
					end
				,3000,1)
				end
			end
		end
	end
end

function markerhitofitititi(player)
	if player == getLocalPlayer() then
		veh = getPedOccupiedVehicle(player)
		if veh then
			if getVehicleName(veh) ==  "Mower" then
				acceptthedurin(player)
			end
		end
	end
end
function acceptthedurin(source)
	destroyElement(theMowermissionblip)
	setMarkerColor(theMissiMowerMarker[damarkerdenduhittenmsusst], 95, 255, 0,0)
	removeEventHandler("onClientMarkerHit", theMissiMowerMarker[damarkerdenduhittenmsusst], markerhitofitititi)
	erreichteziele = erreichteziele+1
	local theveh = getElementHealth(veh)
	neuesgeldblub = neuesgeldblub+((theveh/1000)*15)
	theminiMowermissiontext = "Bisher erreichte Checkpoints: "..erreichteziele
	setElementData(getLocalPlayer(), "isMiniMissionActivated", "neuensuchen")
	startminimission(getLocalPlayer())	
end


addEventHandler("onClientVehicleExit", getRootElement(),
	function(thePlayer,seat)
		if thePlayer == getLocalPlayer() and seat == 0 and getElementData(getLocalPlayer(), "isMiniMissionActivated") == true then
			if source == tourVehicle then
				timemissi = 30
				theminiMowermissiontext = "Mahen wird beendet in 30 Sekunden"
				killermission = setTimer(function()
				timemissi = timemissi-1
				theminiMowermissiontext = "Mähen wird beendet in "..timemissi.." Sekunden"
				if timemissi == 0 then
					killTimer(killermission)
					theminiMowermissiontext = "Mähen fehlgeschlagen!"
					setTimer(function()
							removeEventHandler("onClientRender", getRootElement(), startmissi)
							theminiMowermissiontext = ""
							timemissi = 30
							erreichteziele = 0
							neuesgeldblub = 0
							destroyElement(theMowermissionblip)
							setMarkerColor(theMissiMowerMarker[damarkerdenduhittenmsusst], 95, 255, 0,0)
							setElementDimension(theMissiMowerMarker[damarkerdenduhittenmsusst], 1234)
							removeEventHandler("onClientMarkerHit", theMissiMowerMarker[damarkerdenduhittenmsusst], markerhitofitititi)
							setElementData(getLocalPlayer(), "isMiniMissionActivated", false)
							showPlayerHudComponent ( "radar", false )
						end 
					,3500,1)
				end
			end
			,1000,0)
			end
		end
	end
)
addEventHandler("onClientVehicleEnter", getRootElement(),
	function(theplayer,seat)
		if theplayer == getLocalPlayer() and seat == 0 and getElementData(getLocalPlayer(), "isMiniMissionActivated") == true then
			if source == tourVehicle then
				if isTimer(killermission) then
					killTimer(killermission)
					theminiMowermissiontext = "Tour wird fortgefahren!"
					setTimer(
							function()
								theminiMowermissiontext = "Bisher erreichte Checkpoints: "..erreichteziele
							end
						,3000,1)
				end
			end
		end
	end
)
addEventHandler("onClientPlayerWasted", getLocalPlayer(),
	function()
		if getElementData(getLocalPlayer(), "isMiniMissionActivated") == true then
			theminiMowermissiontext = "Tour fehlgeschlagen!"
			setTimer(
				function()
					removeEventHandler("onClientRender", getRootElement(), startmissi)
					theminiMowermissiontext = ""
					timemissi = 30
					erreichteziele = 0
					neuesgeldblub = 0
					destroyElement(theMowermissionblip)
					setMarkerColor(theMissiMowerMarker[damarkerdenduhittenmsusst], 95, 255, 0,0)
					removeEventHandler("onClientMarkerHit", theMissiMowerMarker[damarkerdenduhittenmsusst], markerhitofitititi)
					setElementData(getLocalPlayer(), "isMiniMissionActivated", false)
					showPlayerHudComponent ( "radar", false )
				end 
			,3500,1)
		end
	end
)