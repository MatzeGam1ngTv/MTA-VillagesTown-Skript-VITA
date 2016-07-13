local GhettoSound = nil
function attachsoundtoplayer(act)
	if (act == "play") then
		GhettoSound = playSound3D("http://listen.technobase.fm/dsl.asx",0,0,0)            
		attachElements(GhettoSound,source)
		setSoundVolume(GhettoSound, 10.0)
		setSoundMaxDistance(GhettoSound, 50)
	else
		if (isElement(GhettoSound)) then
			destroyElement(GhettoSound)
		end
	end
end
addEvent("speaker", true)
addEventHandler("speaker", root, attachsoundtoplayer)