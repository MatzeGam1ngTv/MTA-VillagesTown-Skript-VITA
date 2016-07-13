--[[
Project: VitaOnline
File: pizza-server.lua
Author(s):	Golf_R32
			Sebihunter
]]--

local miniMissionPizza = {}

function loadPizzaBikes()
miniMissionPizza[1] = createRPGVehicle ( 574, 2122.4, -1784.3, 12.2, 0, "Pizza", { {255, 0, 0}, {255, 0, 0}, {0, 0, 0}, {0, 0, 0} }, true, false )
miniMissionPizza[2] = createRPGVehicle ( 574, 2119.6, -1784.3, 12.2, 0, "Pizza", { {255, 0, 0}, {255, 0, 0}, {0, 0, 0}, {0, 0, 0} }, true, false )
miniMissionPizza[3] = createRPGVehicle ( 574, 2117.0, -1784.3, 12.2, 0, "Pizza", { {255, 0, 0}, {255, 0, 0}, {0, 0, 0}, {0, 0, 0} }, true, false )
miniMissionPizza[4] = createRPGVehicle ( 574, 2114.2, -1784.3, 12.2, 0, "Pizza", { {255, 0, 0}, {255, 0, 0}, {0, 0, 0}, {0, 0, 0} }, true, false )
miniMissionPizza[5] = createRPGVehicle ( 574, 2111.6, -1784.3, 12.2, 0, "Pizza", { {255, 0, 0}, {255, 0, 0}, {0, 0, 0}, {0, 0, 0} }, true, false )
miniMissionPizza[6] = createRPGVehicle ( 574, 2108.9, -1784.3, 12.2, 0, "Pizza", { {255, 0, 0}, {255, 0, 0}, {0, 0, 0}, {0, 0, 0} }, true, false )
miniMissionPizza[7] = createRPGVehicle ( 574, 2106.2, -1784.3, 12.2, 0, "Pizza", { {255, 0, 0}, {255, 0, 0}, {0, 0, 0}, {0, 0, 0} }, true, false )
miniMissionPizza[8] = createRPGVehicle ( 574, 2103.6, -1784.3, 12.2, 0, "Pizza", { {255, 0, 0}, {255, 0, 0}, {0, 0, 0}, {0, 0, 0} }, true, false )
miniMissionPizza[9] = createRPGVehicle ( 574, 2101.0, -1784.3, 12.2, 0, "Pizza", { {255, 0, 0}, {255, 0, 0}, {0, 0, 0}, {0, 0, 0} }, true, false )

	for i = 1,#miniMissionPizza do
		setElementData( miniMissionPizza[i], "doNotLooseFuel", true)
		toggleVehicleRespawn( miniMissionPizza[i], true )
		setVehicleIdleRespawnDelay ( miniMissionPizza[i], 60000 )
		setVehicleHandling(miniMissionPizza[i], "engineAcceleration", 5)
		setVehicleHandling(miniMissionPizza[i], "maxVelocity", 200 )
		setElementData( miniMissionPizza[i], "shallRespawn", true)
	end		
end	
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), loadPizzaBikes)