local voiceCol, voiceColPlayer, voicePlayers, mutedPlayers, adminMutedPlayers = {}, {}, {}, {}, {}
local radiusforvoice = 30
function startResourceVoice ( )
	for _, player in pairs ( getElementsByType ( "player" ) ) do
		setPlayerVoiceIgnoreFrom ( player, getElementsByType ( "player" ) )
		voicePlayers[player] = {}
		mutedPlayers[player] = {}
	end
end
addEventHandler ( "onResourceStart", getResourceRootElement(), startResourceVoice )
function stopResourceVoice ( )
      for _, col in pairs ( voiceCol ) do
            destroyElement ( col )
      end
end
addEventHandler ( "onResourceStop", getResourceRootElement(), stopResourceVoice )
function prepareForVoice ( )
	setPlayerVoiceIgnoreFrom ( source, getElementsByType ( "player" ) )
	voicePlayers[source] = {}
	mutedPlayers[source] = {}
end
addEventHandler ( "onPlayerJoin", getRootElement(), prepareForVoice )
function stopVoice ( )
	if voiceCol[source] then
		destroyElement ( voiceCol[source] )
		voiceCol[source] = nil
	end
	if voicePlayers[source] then
		voicePlayers[source] = nil
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), stopVoice )
function onPlayerVoiceStart_func ( )
	if isVoiceEnabled () then
		if not adminMutedPlayers[getPlayerName(source)] then
			if not isPedDead ( source ) then
				local dim = getElementDimension ( source )
				local int = getElementInterior ( source )
				voiceCol[source] = createColSphere ( 0, 0, 0, radiusforvoice )
				attachElements ( voiceCol[source], source )
				voiceColPlayer[voiceCol[source]] = source
				for _, player in pairs ( getElementsWithinColShape ( voiceCol[source], "player" ) ) do
					if not isPedDead ( player ) and getElementDimension ( player ) == dim and getElementInterior ( player ) == int and not mutedPlayers[getPlayerName(player)][source] then
						voicePlayers[source][player] = true
						setPlayerVoiceBroadcastTo ( source, player )
					end
				end
				addEventHandler ( "onColShapeHit", voiceCol[source], playerWentInVoiceRange )
				addEventHandler ( "onColShapeLeave", voiceCol[source], playerWentOutOfVoiceRange )
				addEventHandler ( "onPlayerVoiceStop", source, onPlayerVoiceStop_func )
			else
				cancelEvent()
			end
		else
			cancelEvent()
			outputChatBox ( "Du bist noch gemutet!", source, 155, 0, 0 )
		end
	else
		outputDebugString ( "Voice ist noch deaktiviert!" )
	end
end
addEventHandler ( "onPlayerVoiceStart", getRootElement(), onPlayerVoiceStart_func )
function onPlayerVoiceStop_func ( )
	for player, _ in pairs ( voicePlayers[source] ) do
		setPlayerVoiceIgnoreFrom ( source, player )
	end
	if voiceCol[source] then
		destroyElement ( voiceCol[source] )
		voiceCol[source] = nil
	end
	voicePlayers[source] = {}
	removeEventHandler ( "onPlayerVoiceStop", source, onPlayerVoiceStop_func )
end
function playerWentInVoiceRange ( element, dim )
	if getElementType ( element ) == "player" and dim and ( mutedPlayers[getPlayerName(voiceColPlayer[source])] and not mutedPlayers[getPlayerName(voiceColPlayer[source])][element] ) then
		local player = voiceColPlayer[source]
		voicePlayers[player][element] = true
	end
end
function playerWentOutOfVoiceRange ( element, dim )
	if getElementType ( element ) == "player" and dim then
		local player = voiceColPlayer[source]
		voicePlayers[player][element] = nil
	end
end
function muteAPlayer ( player, cmd, target )
	if getPlayerFromName ( target ) then        -- DEAKTIVIEREN BEI VIO
		local target = getPlayerFromName ( target )        -- DEAKTIVIEREN BEI VIO
		if mutedPlayers[getPlayerName(player)][target] then
			mutedPlayers[getPlayerName(player)][target] = nil
			outputChatBox ( "Du hast "..getPlayerName ( target ) .. " entmutet!", player, 0, 155, 0 )
		else
			mutedPlayers[getPlayerName(player)][target] = true
			outputChatBox ( "Du hast "..getPlayerName ( target ) .. " gemutet!", player, 0, 155, 0 )
		end
	else
		outputChatBox ( "Spieler existiert nicht!", player, 0, 155, 0 )
	end
end
addCommandHandler ( "mute", muteAPlayer )
function adminMuteAPlayer ( player, cmd, target )
		if getPlayerFromName ( target ) then        -- DEAKTIVIEREN BEI VIO
			if adminMutedPlayers[target] then
				adminMutedPlayers[target] = nil
				outputChatBox ( "Du hast ".. target .. " entmutet!", player, 0, 155, 0 )
			else
				adminMutedPlayers[target] = true
				outputChatBox ( "Du hast ".. target .. " gemutet!", player, 0, 155, 0 )
			end
			outputChatBox ( "Du wurdest von "..getPlayerName ( player ) .. " gemutet!", getPlayerFromName ( target ), 155, 0, 0 )        -- DEAKTIVIEREN BEI VIO
		else
			outputChatBox ( "Spieler existiert nicht!", player, 0, 155, 0 )
		end
end
addCommandHandler ( "amute", adminMuteAPlayer )