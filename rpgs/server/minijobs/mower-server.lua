--[[
Project: VitaOnline
File: Mower-server.lua
Author(s):	Golf_R32
			Sebihunter
]]--

local miniMissionMower = {}
function loadMowerBikes()
	miniMissionMower[1] = createRPGVehicle(572, 939.4, -1126, 22.5, 0, "Geartner", {{ 0, 255, 0 }, { 0, 255, 0 }, { 0, 0, 0 }, { 0, 0, 0 }}, true, false)
	miniMissionMower[2] = createRPGVehicle(572, 936.3, -1126, 22.5, 0, "Geartner", {{ 0, 255, 0 }, { 0, 255, 0 }, { 0, 0, 0 }, { 0, 0, 0 }}, true, false)
	miniMissionMower[3] = createRPGVehicle(572, 933.1, -1126, 22.5, 0, "Geartner", {{ 0, 255, 0 }, { 0, 255, 0 }, { 0, 0, 0 }, { 0, 0, 0 }}, true, false)
	miniMissionMower[4] = createRPGVehicle(572, 928.4, -1126, 22.5, 0, "Geartner", {{ 0, 255, 0 }, { 0, 255, 0 }, { 0, 0, 0 }, { 0, 0, 0 }}, true, false)
	miniMissionMower[5] = createRPGVehicle(572, 925.2, -1126, 22.5, 0, "Geartner", {{ 0, 255, 0 }, { 0, 255, 0 }, { 0, 0, 0 }, { 0, 0, 0 }}, true, false)
	miniMissionMower[6] = createRPGVehicle(572, 922.1, -1126, 22.5, 0, "Geartner", {{ 0, 255, 0 }, { 0, 255, 0 }, { 0, 0, 0 }, { 0, 0, 0 }}, true, false)
	for i = 1,#miniMissionMower do
		setElementData( miniMissionMower[i], "doNotLooseFuel", true)
		toggleVehicleRespawn( miniMissionMower[i], true )
		setVehicleIdleRespawnDelay ( miniMissionMower[i], 60000 )
		setElementData( miniMissionMower[i], "shallRespawn", true)
	end		
end	
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), loadMowerBikes)