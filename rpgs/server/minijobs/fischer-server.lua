--[[
Project: VitaOnline
File: fischer-server.lua
Author(s):	Golf_R32
			Sebihunter
]]--

local miniMissionFischer = {}
function createFischerJobVehicle()
	--Hafen SF
	miniMissionFischer[1] = createRPGVehicle ( 453, -485.6, 1134.0, 0, 176, "FISCHER", {{ 250, 210, 50 }, { 0, 0, 0 }, { 0, 0, 0 }, { 0, 0, 0 }}, true, false )
	miniMissionFischer[2] = createRPGVehicle ( 453, -484.8, 1146.5, 0, 176, "FISCHER", {{ 250, 210, 50 }, { 0, 0, 0 }, { 0, 0, 0 }, { 0, 0, 0 }}, true, false )
	miniMissionFischer[3] = createRPGVehicle ( 453, -483.9, 1158.8, 0, 176, "FISCHER", {{ 250, 210, 50 }, { 0, 0, 0 }, { 0, 0, 0 }, { 0, 0, 0 }}, true, false )
	miniMissionFischer[4] = createRPGVehicle ( 453, -473.5, 1131.3, 0, 176, "FISCHER", {{ 250, 210, 50 }, { 0, 0, 0 }, { 0, 0, 0 }, { 0, 0, 0 }}, true, false )
	miniMissionFischer[5] = createRPGVehicle ( 453, -472.6, 1143.5, 0, 176, "FISCHER", {{ 250, 210, 50 }, { 0, 0, 0 }, { 0, 0, 0 }, { 0, 0, 0 }}, true, false )


	for i = 1,#miniMissionFischer do
		setElementData( miniMissionFischer[i], "doNotLooseFuel", true)
		toggleVehicleRespawn( miniMissionFischer[i], true )
		setVehicleIdleRespawnDelay ( miniMissionFischer[i], 60000 )
		setElementData( miniMissionFischer[i], "shallRespawn", true)
	end		
end	
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), createFischerJobVehicle)
