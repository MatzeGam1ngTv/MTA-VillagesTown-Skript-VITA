local gate3 = createObject( 16773, 321.3, -1188.2, 75.9, 0, 0, 38.5 )
Status = 0

function open_func3 ( player )
	local pname = getPlayerName(player)
	if pname == "Florian.Mrpacman" or pname == "Marcel.Zockerhd" then
		if Status == 0 then
			if getDistanceBetweenPoints3D ( 321.3, -1188.2, 75.9, getElementPosition ( player ) ) < 20 then
				moveObject( gate3, 3000, 321.3, -1188.2, 55.0 )
				Status = 1
				setTimer( close_gate3, 13000, 1 )
				outputChatBox( "Das Tor schließt in 10 Sekunden Automatisch", player, 0, 255, 0 )
			else
				outputChatBox( "Du bist zuweit vom Tot enfernt!", player, 255, 0, 0 )
			end
		end
	else
		outputChatBox( "Du bist nicht Berechtigt dieses Tor zu Öffnen", player, 255, 0, 0 )
	end	
end
addCommandHandler( "mrgate", open_func3 )

--[[ Gate3 schliesen, Parkplatz ]]
function close_gate3()
	moveObject( gate3, 3000, 321.3, -1188.2, 75.9 )
	Status = 0
end
