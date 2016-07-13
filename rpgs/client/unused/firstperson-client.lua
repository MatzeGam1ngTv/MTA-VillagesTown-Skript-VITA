--[[
Project: VitaOnline
File: firstperson-client.lua
Author(s):	Tjong
]]--

gFirstPerson = false -- determines if the player is in first-person-mode
gMouseScaleFactor = 150.0 -- sets how sensitive the first person mode is
gHeadMoveLimitsXY = 90.0; -- limits the head moving on the xy - axis
gHeadMoveLimitsZdown = -45.0; -- limits the head moving limit "down"
gHeadMoveLimitsZup = 90.0; --limits the head moving limit "up"

local viewAngleXY, viewAngleZ = 0.0, 0.0;

function firstPersonSync()
	
	-- getPositions
	local faceX, faceY, faceZ = getPedBonePosition(getLocalPlayer(), 8);
	faceZ = faceZ + 0.2
	
	-- cursor-stuff
	local cursorX, cursorY, _, _, _ = getCursorPosition();
	if(not isMainMenuActive()) then
		-- only calulating cursor-stuff if the MTA Menu is not active
		-- calculate a factor
		cursorX, cursorY = (0.5 - cursorX) * gMouseScaleFactor, (0.5 - cursorY) * gMouseScaleFactor;
		viewAngleXY = viewAngleXY + cursorX;
		viewAngleZ  = viewAngleZ  + cursorY;
    	setCursorPosition(screenCenterX, screenCenterY);
    else
    	cursorX, cursorY = screenCenterX, screenCenterY;
    end
	
	if(isPedInVehicle(getLocalPlayer())) then
		-- turning view when in vehicle
		local _, _, newVehicleAngle = getElementRotation(getPedOccupiedVehicle(getLocalPlayer()));
		local diff =  newVehicleAngle - gLastVehicleAngle;
		if(diff > 180.0) then
			diff = diff - 360.0;
		end
		viewAngleXY = viewAngleXY + diff;
		gLastVehicleAngle = newVehicleAngle;
		faceZ = faceZ - 0.1
	end
	
	-- controlling head-movement + sphere calculating limits
	if(viewAngleZ > gHeadMoveLimitsZup) then viewAngleZ = gHeadMoveLimitsZup;
	elseif(viewAngleZ < gHeadMoveLimitsZdown) then viewAngleZ = gHeadMoveLimitsZdown;
	end
	if(viewAngleXY > 360.0) then viewAngleXY = viewAngleXY - 360.0 end
	if(viewAngleXY < 0.0) then viewAngleXY = viewAngleXY + 360.0 end
	local diff = getPedRotation(getLocalPlayer())-viewAngleXY;
	if(diff > 180.0) then diff = diff - 360; end
	if(diff < -180.0) then diff = diff + 360; end
	if(diff > gHeadMoveLimitsXY) then viewAngleXY = getPedRotation(getLocalPlayer())-gHeadMoveLimitsXY;
	elseif(diff < -gHeadMoveLimitsXY) then viewAngleXY = getPedRotation(getLocalPlayer())+gHeadMoveLimitsXY;
	end
	
	-- sphere calculation
	local lookAtX, lookAtY, lookAtZ = getPointOnSphere(0.0, 0.0, 0.0, 0.4, viewAngleXY, viewAngleZ);
	
	-- setting camera
	setCameraMatrix(faceX + lookAtX, faceY + lookAtY, faceZ, faceX + lookAtX*2, faceY + lookAtY*2, faceZ + lookAtZ*2);
    
    dxDrawText("Angle: XY:"..tostring(viewAngleXY).." Z: "..tostring(viewAngleZ), 400, 0);
end

addCommandHandler("fp", 
	function ()
		gFirstPerson = not gFirstPerson;
		if(gFirstPerson) then
			showCursor(true, false);
			viewAngleXY, viewAngleZ = getPedRotation(getLocalPlayer()), 0.0;
			addEventHandler("onClientPreRender", root, firstPersonSync);
		else
			showCursor(false, false);
			removeEventHandler("onClientPreRender", root, firstPersonSync);
			setCameraTarget(getLocalPlayer());
		end
	end
);

addEventHandler("onClientPlayerVehicleEnter", root, 
	function (vehicle)
		_, _, gLastVehicleAngle = getElementRotation(vehicle);
	end
);

if(not callServerFunction) then
	function callServerFunction(funcname, ...)
		local arg = table.map({...}, -1, {number = tostring})
		triggerServerEvent("onClientCallsServerFunction", root, funcname, arg)
	end
	addEvent("onServerCallsClientFunction", true)
	addEventHandler("onServerCallsClientFunction", root, function (funcname, arg) loadstring("return "..funcname)()(unpack(table.convert(arg, -1))) end)
end
