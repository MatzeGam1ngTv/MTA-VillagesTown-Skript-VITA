local radioStations = {
	{name="Energy Wien 104.2",url="http://85.10.203.75:8000/vie.m3u"},
	{name="Blackbeats.FM", url="http://blackbeats.fm/listen.asx"},	
	{name="Energy Dance",url="http://radio.nrj.net/dance/radioat"},
	{name="TechnoBase.FM", url="http://listen.technobase.fm/aacplus.pls"},
	{name="Germany Top 100 Station",url="http://www.top100station.de/switch/top100station_lq.asx"},
	{name="TranceBase.FM", url="http://listen.trancebase.fm/dsl.pls"},
	{name="Radio Nora 80er", url="http://streams.radionora.de/nora-80er/mp3-128/surfmusik"},
	{name="HardBase.FM", url="http://listen.hardbase.fm/dsl.pls"},
	{name="I <3 RADIO",url="http://www.iloveradio.de/iloveradio.m3u"}
}

local SOUND_MIN_RANGE_OUT_OF_VEHICLE = 2
local SOUND_MAX_RANGE_OUT_OF_VEHICLE = 12
local SOUND_VOLUME_OUT_OF_VEHICLE    = 1.0
local SOUND_EFFECTS_OUT_OF_VEHICLE   = {"compressor","i3dl2reverb"}

local SOUND_MIN_RANGE_IN_VEHICLE     = 5
local SOUND_MAX_RANGE_IN_VEHICLE     = 200
local SOUND_VOLUME_IN_VEHICLE        = 1
local SOUND_EFFECTS_IN_VEHICLE       = {}
local vehSeat = 0

local curStationScrollID = 0

local datTimer = false

function handleRadioResourceStart()
	setRadioChannel(0)
end
addEventHandler("onClientResourceStart",getResourceRootElement(),handleRadioResourceStart)

function handleRadioResourceStop()
	for index, vehicle in ipairs(getElementsByType("vehicle")) do
		stopVehicleRadio(vehicle)
	end
end
addEventHandler("onClientResourceStop",getResourceRootElement(),handleRadioResourceStop)

function handleRadioVehicleEnter(veh, seat)
	vehSeat = seat
	setRadioChannel(0)
	if getVehicleType(veh) == "BMX" then return end
	local sound = getElementData(veh,"radio:sound")
	startVehicleRadio(veh)
	if sound then
		setSoundMinDistance(sound,SOUND_MIN_RANGE_IN_VEHICLE)
		setSoundMaxDistance(sound,SOUND_MAX_RANGE_IN_VEHICLE)
		setSoundVolume(sound,SOUND_VOLUME_IN_VEHICLE)
		for index, effect in ipairs(SOUND_EFFECTS_OUT_OF_VEHICLE) do
			setSoundEffectEnabled(sound,effect,false)
		end
		for index, effect in ipairs(SOUND_EFFECTS_IN_VEHICLE) do
			setSoundEffectEnabled(sound,effect,true)
		end
	end
	local channel = tonumber(getElementData(veh,"radio:channel")) or 0
	if radioStations[channel] then
		showRadioDisplay(tostring(radioStations[channel].name))
	else
		showRadioDisplay("Radio off")
	end
end
addEventHandler("onClientPlayerVehicleEnter",getLocalPlayer(),handleRadioVehicleEnter)

function handleRadioVehicleExit(veh)
	vehSeat = 0
	local sound = getElementData(veh,"radio:sound")
	
	if sound then
		setSoundMinDistance(sound,SOUND_MIN_RANGE_OUT_OF_VEHICLE)
		setSoundMaxDistance(sound,SOUND_MAX_RANGE_OUT_OF_VEHICLE)
		setSoundVolume(sound,SOUND_VOLUME_OUT_OF_VEHICLE)
		for index, effect in ipairs(SOUND_EFFECTS_IN_VEHICLE) do
			setSoundEffectEnabled(sound,effect,false)
		end
		for index, effect in ipairs(SOUND_EFFECTS_OUT_OF_VEHICLE) do
			setSoundEffectEnabled(sound,effect,true)
		end
	end
	hideRadioDisplay()
	stopVehicleRadio(veh)
end
addEventHandler("onClientPlayerVehicleExit",getLocalPlayer(),handleRadioVehicleExit)

function handleRadioChannelSwitch(newChannel)
	if newChannel == 0 then
		return
	elseif vehSeat ~= 0 then
		cancelEvent()
		return
	end
	cancelEvent()
	local vehicle = getPedOccupiedVehicle(getLocalPlayer())
	if not vehicle then
		return
	end
	if getVehicleType(vehicle) == "BMX" then return end
	local channel = tonumber(getElementData(vehicle,"radio:channel")) or 0
	local increment = (newChannel == 1 and 1) or -1
	channel = channel + increment
	if channel > #radioStations then
		channel = 0
	elseif channel < 0 then
		channel = #radioStations
	end
	setElementData(vehicle,"radio:channel",channel)
end
addEventHandler("onClientPlayerRadioSwitch",getRootElement(),handleRadioChannelSwitch)

function handleVehicleRadioChannelSwitch(key)
	if getElementType(source) == "vehicle" and key == "radio:channel" then
		startVehicleRadio(source)
		if source == getPedOccupiedVehicle(getLocalPlayer()) then
			local channel = tonumber(getElementData(source,"radio:channel")) or 0
			if radioStations[channel] then
				showRadioDisplay(tostring(radioStations[channel].name))
			else
				showRadioDisplay("Radio off")
			end
		end
	end
end
addEventHandler("onClientElementDataChange",getRootElement(),handleVehicleRadioChannelSwitch)

function startVehicleRadio(vehicle)
	if isElement(vehicle) and getElementType(vehicle) == "vehicle" and isElementStreamedIn(vehicle) then
		stopVehicleRadio(vehicle)
		local channelID = tonumber(getElementData(vehicle,"radio:channel")) or 0
		local channel = radioStations[channelID]
		if channel then
			local url = channel.url
			if type(url) == "string" and #url > 0 then
				local x1, y1, z1 = getElementPosition ( vehicle )
			if datTimer and isTimer(datTimer) then killTimer(datTimer) end
				datTimer = setTimer(function()
					local sound = playSound3D(url,x1,y1,z1)
					if sound then
						setElementData(vehicle,"radio:sound",sound,false)
						setElementParent(sound,vehicle)
						attachElements(sound,vehicle)
						addEventHandler("onClientSoundStream",sound,handleVehicleRadioStream)
						addEventHandler("onClientElementDestroy",sound,handleRadioSoundDestroyed)
					end
				end, 200, 1)
			end
		end
	end
	
	return false
end

function stopVehicleRadio(vehicle)
	if isElement(vehicle) and getElementType(vehicle) == "vehicle" then
		local sound = getElementData(vehicle,"radio:sound")
		if datTimer and isTimer(datTimer) then killTimer(datTimer) end
		if sound then
			setElementData(vehicle,"radio:sound",false,false)
			if isElement(sound) and getElementType(sound) == "sound" and getElementParent(sound) == vehicle then
				destroyElement(sound)
				return true
			end
		end
	end
	
	return false
end

function handleVehicleRadioStream(success)
	local vehicle = getElementParent(source)
	if not success then
		stopVehicleRadio(vehicle)
		startVehicleRadio(vehicle)
	else
		local minDist
		local maxDist
		local volume
		local effects
		if vehicle == getPedOccupiedVehicle(getLocalPlayer()) then
			minDist = SOUND_MIN_RANGE_IN_VEHICLE
			maxDist = SOUND_MAX_RANGE_IN_VEHICLE
			volume  = SOUND_VOLUME_IN_VEHICLE
			effects = SOUND_EFFECTS_IN_VEHICLE
		else
			minDist = SOUND_MIN_RANGE_OUT_OF_VEHICLE
			maxDist = SOUND_MAX_RANGE_OUT_OF_VEHICLE
			volume  = SOUND_VOLUME_OUT_OF_VEHICLE
			effects = SOUND_EFFECTS_OUT_OF_VEHICLE
		end
		setSoundMinDistance(source,minDist)
		setSoundMaxDistance(source,maxDist)
		setSoundVolume(source,volume)
		
		for index,effect in ipairs(effects) do
			setSoundEffectEnabled(sound,effect,true)
		end
	end
end

function handleRadioSoundDestroyed()
	local vehicle = getElementParent(source)
	if isElement(vehicle) and getElementData(vehicle,"radio:sound") == source then
		startVehicleRadio(vehicle)
	end
end