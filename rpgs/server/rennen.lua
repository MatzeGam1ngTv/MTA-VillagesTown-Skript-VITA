function resourceStart ()
    setGlitchEnabled ( "fastsprint", true )
end
addEventHandler ( "onResourceStart", getResourceRootElement ( ), resourceStart )

function handleOnPlayerModInfo ( filename, modList )
    local line = ""
    for idx,mod in ipairs(modList) do
        for k,v in pairs(mod) do
			if tonumber(v) then 
			else
				line = line ..tostring(v)
			end
        end
    end
	if string.find(line,".ipl") then
		kickPlayer(source,"Dein GTA:SA ist modifiziert! ( Kartenmod )")
	end
end
addEventHandler ( "onPlayerModInfo", getRootElement(), handleOnPlayerModInfo )