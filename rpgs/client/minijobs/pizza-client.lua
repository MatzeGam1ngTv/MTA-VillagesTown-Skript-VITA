--[[
Project: VitaOnline
File: pizza-client.lua
Author(s):	Golf_R32
			Sebihunter
]]--

local pizzaTourVehicle = false
local pizzaCooldown = false

local pizzaPos = {
    [1] = { x = 2156.7, y = -1800.0, z = 12.4 },
    [2] = { x = 2373.3, y = -1785.5, z = 12.6 },
    [3] = { x = 2463.5, y = -2000.7, z = 12.6 },
    [4] = { x = 2639.7, y = -1994.2, z = 12.6 },
    [5] = { x = 2803.9, y = -1936.6, z = 12.6 },
    [6] = { x = 2852.7, y = -1333.1, z = 10.1 },
    [7] = { x = 2798.6, y = -1087.4, z = 29.7 },
    [8] = { x = 2175.0, y = -995.20, z = 62.0 },
    [9] = { x = 2049.8, y = -1113.6, z = 24.4 },
    [10] = { x = 1465.8, y = -1171.9, z = 22.8 },
    [11] = { x = 1050.9, y = -1048.3, z = 30.7 },
    [12] = { x = 791.10, y = -841.90, z = 59.6 },
    [13] = { x = 497.90, y = -1084.0, z = 81.3 },
    [14] = { x = 216.70, y = -1397.7, z = 50.6 },
    [15] = { x = 281.00, y = -1771.3, z = 3.50 }
}


local theMissiPizzaMarker = {}

function startthePizzamarker()
	theMissiPizzaMarkerMain = createMarker( 2102.9, -1769.8, 12.4, "cylinder", 2.5, 245,158,9, 255 )
	for i,v in ipairs(pizzaPos) do
		theMissiPizzaMarker[#theMissiPizzaMarker+1] = createMarker(v.x,v.y,v.z,"cylinder", 2, 245,158,9, 0)
	end
	
	for i = 1,#theMissiPizzaMarker do
			if isElement(theMissiPizzaMarker[i]) then
				setElementDimension(theMissiPizzaMarker[i], 1234)
			end
		end
		addEventHandler("onClientMarkerHit", theMissiPizzaMarkerMain,startminimission1)
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), startthePizzamarker)

local theminiPizzamissiontext = ""
local neuesgeldblub = 0
local erreichteziele = 0
function startmissi1 ()
	local x,y = guiGetScreenSize()

	dxDrawText(theminiPizzamissiontext, 5,0,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiPizzamissiontext, 0,5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiPizzamissiontext, 0,-5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiPizzamissiontext, -5,0,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)

	dxDrawText(theminiPizzamissiontext, 5,5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiPizzamissiontext, -5,5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiPizzamissiontext, 5,-5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
	dxDrawText(theminiPizzamissiontext, -5,-5,x,y*0.25,tocolor(0,0,0,255), 1.4, "bankgothic", "center", "center",true,true,true)

	dxDrawText(theminiPizzamissiontext, 0,0,x,y*0.25,tocolor(255,100,0,255), 1.4, "bankgothic", "center", "center",true,true,true)
end
setElementData(getLocalPlayer(), "isMiniMissionActivatedPizza", false)
exports.customblips:createCustomBlip( 2102.9, -1769.8, 16, 16, "images/blips/pizzajob.png" )
function startminimission1(player)
	if getLocalPlayer() == player then
		if pizzaCooldown == true then return end
		if getElementData(getLocalPlayer(), "dienst") == 1 then addNotification(1, 255, 0, 0, "Du kannst keinen Nebenjob beginnen\nwenn du im Dienst bist.") return end
		veh = getPedOccupiedVehicle(player)
		if not veh then addNotification(1, 255, 0, 0, "Du kannst den Minijob nur in einem 'Sweeper' oder 'Pizzaboy' beginnen.") return end
		if veh then
			if getVehicleOccupant(veh) == getLocalPlayer() then
				if getVehicleName(veh) ==  "Sweeper" or getVehicleName(veh) ==  "Pizzaboy" then
				if getElementData(getLocalPlayer(), "isMiniMissionActivatedPizzaPizza") ~= true then
					if getElementData(getLocalPlayer(), "isMiniMissionActivatedPizza") == false then
							if killermission and isTimer(killermission) then killTimer(killermission) end
							if isTimer(theverdienstgeldtimer) then killTimer(theverdienstgeldtimer) end
							addEventHandler("onClientRender", getRootElement(), startmissi1)
							theminiPizzamissiontext = "Tour wurde gestartet!"
							showTutorialMessage("pizza_1", "Hilf Luigi die heiße Pizza schnell zum Kunden zu bringen. Fahre dazu einfach vor das Haus um die Pizza zu abzuliefern.")
							pizzaTourVehicle = veh
							neuesgeldblub = 0
							setElementData(getLocalPlayer(), "isMiniMissionActivatedPizza", true)
							showPlayerHudComponent ( "radar", true )
							thebishergestartedtimer = setTimer(
						function()
							theminiPizzamissiontext = "Bisher erreichte Kunden: "..erreichteziele
						end,3000,1)
							damarkerdenduhittenmsusst = math.random(1,#theMissiPizzaMarker)
							setMarkerColor(theMissiPizzaMarker[damarkerdenduhittenmsusst], 95, 255, 0,100)
							setElementDimension(theMissiPizzaMarker[damarkerdenduhittenmsusst], 0)
							thePizzamissionblip = createBlip(getElementPosition(theMissiPizzaMarker[damarkerdenduhittenmsusst]))
							addEventHandler("onClientMarkerHit", theMissiPizzaMarker[damarkerdenduhittenmsusst], markerhitofitititi1)
						elseif getElementData(getLocalPlayer(), "isMiniMissionActivatedPizza") == "neuensuchen" then
							if isTimer(theverdienstgeldtimer) then killTimer(theverdienstgeldtimer) end
							setElementData(getLocalPlayer(), "isMiniMissionActivatedPizza", true)
							damarkerdenduhittenmsusst = math.random(1,#theMissiPizzaMarker)
							setMarkerColor(theMissiPizzaMarker[damarkerdenduhittenmsusst], 95, 255, 0,100)
							setElementDimension(theMissiPizzaMarker[damarkerdenduhittenmsusst], 0)
							thePizzamissionblip = createBlip(getElementPosition(theMissiPizzaMarker[damarkerdenduhittenmsusst]))
							addEventHandler("onClientMarkerHit", theMissiPizzaMarker[damarkerdenduhittenmsusst], markerhitofitititi1)
						else
							if isTimer(thebishergestartedtimer) then killTimer(thebishergestartedtimer) end
								setElementData(getLocalPlayer(), "isMiniMissionActivatedPizza", false)
								theminiPizzamissiontext = "Tour wurde abgebrochen!"
								if killermission and isTimer(killermission) then killTimer(killermission) end
								destroyElement(thePizzamissionblip)
								setMarkerColor(theMissiPizzaMarker[damarkerdenduhittenmsusst], 95, 255, 0,0)
								setElementDimension(theMissiPizzaMarker[damarkerdenduhittenmsusst], 1234)
								removeEventHandler("onClientMarkerHit", theMissiPizzaMarker[damarkerdenduhittenmsusst], markerhitofitititi1)
								pizzaCooldown = true
								setTimer(function() pizzaCooldown = false end, 15000, 1)
								theverdienstgeldtimer = setTimer(
								function()
									neuesgeldblub = math.floor(neuesgeldblub)
									theminiPizzamissiontext = "Du hast "..neuesgeldblub.. " Vero verdient!"
									triggerServerEvent("giveTheMiniMissionPrize", getLocalPlayer(),getLocalPlayer(), neuesgeldblub)
									erreichteziele = 0
									showPlayerHudComponent ( "radar", false )
									theverdienstgeldtimer = setTimer(function() theminiPizzamissiontext = ""  neuesgeldblub = 0 removeEventHandler("onClientRender", getRootElement(), startmissi1) end , 2000,1)
								end
								,3000,1)
			
					end
					end
								else
				theminiPizzamissiontext = "Du brauchst einen 'Sweeper' um diese Tour zu starten!"
				if isTimer(theshitcarisfalschtimer) then
					killTimer(theshitcarisfalschtimer)
				end
				theshitcarisfalschtimer = setTimer(
				function()
					theminiPizzamissiontext = ""
					end
				,3000,1)
				end
			end
		end
	end
end



function leftthemarkerofthemissi1(source)
	if source == getLocalPlayer() then
		if isTimer(theidletimerstart) then
			killTimer(theidletimerstart)
			theminiPizzamissiontext = "Liefern unterbrochen! Bitte wiederholen!"
			removeEventHandler("onClientMarkerLeave", theMissiPizzaMarker[damarkerdenduhittenmsusst],leftthemarkerofthemissi1)
		end
	end
end
function markerhitofitititi1(player)
	if player == getLocalPlayer() then
		veh = getPedOccupiedVehicle(player)
		if veh then
			if getVehicleName(veh) ==  "Sweeper" or getVehicleName(veh) ==  "Pizzaboy" then
				theminiPizzamissiontext = "Wird abgeliefert!"
				theidletimerstart = setTimer(acceptthedurin1, 3000,1, player)
				addEventHandler("onClientMarkerLeave", theMissiPizzaMarker[damarkerdenduhittenmsusst], leftthemarkerofthemissi1)
			end
		end
	end
end
function acceptthedurin1(source)
	destroyElement(thePizzamissionblip)
	setMarkerColor(theMissiPizzaMarker[damarkerdenduhittenmsusst], 95, 255, 0,0)
	removeEventHandler("onClientMarkerHit", theMissiPizzaMarker[damarkerdenduhittenmsusst], markerhitofitititi1)
	erreichteziele = erreichteziele+1
	local theveh = getElementHealth(veh)
	neuesgeldblub = neuesgeldblub+((theveh/1000)*160)
	theminiPizzamissiontext = "Bisher erreichte Kunden: "..erreichteziele
	showTutorialMessage("pizza_2", "Der erste Kunde ist satt, doch viele warten noch auf ihre Pizza. Fahre entweder zurück zum Startpunkt um den Job zu beenden oder beliefere gleich den nächsten.")
	setElementData(getLocalPlayer(), "isMiniMissionActivatedPizza", "neuensuchen")
	startminimission1(getLocalPlayer())	
end


addEventHandler("onClientVehicleExit", getRootElement(),
	function(thePlayer,seat)
		if thePlayer == getLocalPlayer() and seat == 0 and getElementData(getLocalPlayer(), "isMiniMissionActivatedPizza") == true then
			if source == pizzaTourVehicle then
				timemissi = 30
				theminiPizzamissiontext = "Tour wird beendet in 30 Sekunden"
				killermission = setTimer(function()
				timemissi = timemissi-1
				theminiPizzamissiontext = "Tour wird beendet in "..timemissi.." Sekunden"
				if timemissi == 0 then
					killTimer(killermission)
					theminiPizzamissiontext = "Tour fehlgeschlagen!"
					setTimer(function()
							removeEventHandler("onClientRender", getRootElement(), startmissi1)
							theminiPizzamissiontext = ""
							timemissi = 30
							erreichteziele = 0
							neuesgeldblub = 0
							destroyElement(thePizzamissionblip)
							setMarkerColor(theMissiPizzaMarker[damarkerdenduhittenmsusst], 95, 255, 0,0)
							setElementDimension(theMissiPizzaMarker[damarkerdenduhittenmsusst], 1234)
							removeEventHandler("onClientMarkerHit", theMissiPizzaMarker[damarkerdenduhittenmsusst], markerhitofitititi1)
							setElementData(getLocalPlayer(), "isMiniMissionActivatedPizza", false)
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
		if theplayer == getLocalPlayer() and seat == 0 and getElementData(getLocalPlayer(), "isMiniMissionActivatedPizza") == true then
			if source == pizzaTourVehicle then
				if isTimer(killermission) then
					killTimer(killermission)
					theminiPizzamissiontext = "Tour wird fortgefahren!"
					setTimer(
							function()
								theminiPizzamissiontext = "Bisher erreichte Kunden: "..erreichteziele
							end
						,3000,1)
				end
			end
		end
	end
)
addEventHandler("onClientPlayerWasted", getLocalPlayer(),
	function()
		if getElementData(getLocalPlayer(), "isMiniMissionActivatedPizza") == true then
			theminiPizzamissiontext = "Tour fehlgeschlagen!"
			setTimer(
				function()
					removeEventHandler("onClientRender", getRootElement(), startmissi1)
					theminiPizzamissiontext = ""
					timemissi = 30
					erreichteziele = 0
					neuesgeldblub = 0
					destroyElement(thePizzamissionblip)
					setMarkerColor(theMissiPizzaMarker[damarkerdenduhittenmsusst], 95, 255, 0,0)
					removeEventHandler("onClientMarkerHit", theMissiPizzaMarker[damarkerdenduhittenmsusst], markerhitofitititi1)
					setElementData(getLocalPlayer(), "isMiniMissionActivatedPizza", false)
					showPlayerHudComponent ( "radar", false )
				end 
			,3500,1)
		end
	end
)