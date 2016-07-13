local keypad_fahr_1 = createObject( 2886, 979.55, 2222.5, 11, 0, 0, 270 )
local keypad_fahr_2 = createObject( 2886, 981.025, 2224.4, 11, 0, 0, 90 )
setElementData(keypad_fahr_1, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(keypad_fahr_2, "cinfo", {"Tor Öffnen/Schließen"})
local tor = createObject ( 3089, 980.3, 2224.15, 10.6, 0, 0, 270 )

local keyPadStatefahr1 = 0
local hebebuneMovingfahr1 = false


function keyPad_funcfahr1(theButton, theState, thePlayer)
	local pX, pY, pZ = getElementPosition(thePlayer)
	if theButton == "left" and theState == "down" then
		if hebebuneMovingfahr1 == false then
			if isElement(source) and getElementData(thePlayer, "job") == 10 then
				if source == keypad_fahr_1 or source == keypad_fahr_2 then
					if getDistanceBetweenPoints3D( 979.55, 2222.5, 11, pX, pY, pZ ) < 5 or getDistanceBetweenPoints3D( 981.025, 2224.4, 11, pX, pY, pZ ) < 5 then
						if keyPadStatefahr1 == 0 then
							moveObject(tor, 2000, 980.3, 2224.15, 5.6 )
							keyPadStatefahr1 = 1
							hebebuneMovingfahr1 = true
							setTimer(
								function()
									hebebuneMovingfahr1 = false
								end, 2000, 1)
						elseif keyPadStatefahr1 == 1 then
							moveObject(tor, 2000, 980.3, 2224.15, 10.6 )
							keyPadStatefahr1 = 0
							hebebuneMovingfahr1 = true
							setTimer(
								function()
									hebebuneMovingfahr1 = false
								end, 2000, 1)
						end
					end
				end
			end
		end
	end
end
addEventHandler("onElementClicked", getRootElement(), keyPad_funcfahr1)

----------------------------------------------------------------------------------------------------------------------------------------------

local keypad_fahr_3 = createObject( 2886, 1418.5, -1644.6, 14.2, 0, 0, 0 )
local keypad_fahr_4 = createObject( 2886, 1411.9, -1655.3, 14.1, 0, 0, 180 )
setElementData(keypad_fahr_3, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(keypad_fahr_4, "cinfo", {"Tor Öffnen/Schließen"})
local tor = createObject ( 984, 1415.5, -1646.2, 13, 0, 0, 0 )

local keyPadStatefahr5 = 0
local hebebuneMovingfahr5 = false


function keyPad_funcfahr5(theButton, theState, thePlayer)
	local pX, pY, pZ = getElementPosition(thePlayer)
	if theButton == "left" and theState == "down" then
		if hebebuneMovingfahr5 == false then
			if isElement(source) and getElementData(thePlayer, "job") == 10 then
				if source == keypad_fahr_3 or source == keypad_fahr_4 then
					if getDistanceBetweenPoints3D( 1418.5, -1644.6, 14.2, pX, pY, pZ ) < 5 or getDistanceBetweenPoints3D( 1411.9, -1655.3, 14.1, pX, pY, pZ ) < 5 then
						if keyPadStatefahr5 == 0 then
							moveObject(tor, 2000, 1415.5, -1646.2, 5 )
							keyPadStatefahr5 = 1
							hebebuneMovingfahr5 = true
							setTimer(
								function()
									hebebuneMovingfahr5 = false
								end, 2000, 1)
						elseif keyPadStatefahr5 == 1 then
							moveObject(tor, 2000, 1415.5, -1646.2, 13 )
							keyPadStatefahr5 = 0
							hebebuneMovingfahr5 = true
							setTimer(
								function()
									hebebuneMovingfahr5 = false
								end, 2000, 1)
						end
					end
				end
			end
		end
	end
end
addEventHandler("onElementClicked", getRootElement(), keyPad_funcfahr5)
----------------------------------------------------------------------------------------------------------------------------------------------