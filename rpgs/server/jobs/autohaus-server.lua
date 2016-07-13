--[[
Project: VitaRP
File: autohaus-server.lua
Author(s):	Tommi, Nitaco
]]--

local keypad1up = createObject(2886, 1050.6684570313, 1749.9266357422 , 11.132599830627, 0, 0, 180)
local keypad2down = createObject(2886, 1050.6834716797, 1742.9149169922, 18.564599990845, 0, 0, 0)
setElementData(keypad1up, "cinfo", {"Lift benutzen"})
setElementData(keypad2down, "cinfo", {"Lift benutzen"})
local hebebuhne = createObject ( 16501, 1048.09765625, 1746.4077148438, 9.747200012207, 0, 90, 0)
local keyPadState = 0
local hebebuneMoving = false

setElementDoubleSided(hebebuhne, true)

function keyPad_func(theButton, theState, thePlayer)
	local pX, pY, pZ = getElementPosition(thePlayer)
	if theButton == "left" and theState == "down" then
		if hebebuneMoving == false then
			if isElement(source) and getElementData(thePlayer, "job") == 1 then
				if source == keypad1up or source == keypad2down then
					if getDistanceBetweenPoints3D(1050.6684570313, 1749.9266357422 , 11.132599830627, pX, pY, pZ ) < 10 or getDistanceBetweenPoints3D(1050.6834716797, 1742.9149169922, 18.564599990845, pX, pY, pZ ) < 10 then
						if keyPadState == 0 then
							moveObject(hebebuhne, 2500, 1048.09765625, 1746.4077148438, 17.572599411011)
							keyPadState = 1
							hebebuneMoving = true
							setTimer(
								function()
									hebebuneMoving = false
								end, 2500, 1)
						elseif keyPadState == 1 then
							moveObject(hebebuhne, 2500, 1048.09765625, 1746.4077148438, 9.747200012207)
							keyPadState = 0
							hebebuneMoving = true
							setTimer(
								function()
									hebebuneMoving = false
								end, 2500, 1)
						end
					end
				end
			end
		end
	end
end
addEventHandler("onElementClicked", getRootElement(), keyPad_func)


local keypad3 = createObject(2886, 1094, 1735.400390625, 11.39999961853, 0, 0, 90)
local keypad4 = createObject(2886, 1092.400390625, 1724, 11.39999961853, 0, 0, 270)
setElementData(keypad3, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(keypad4, "cinfo", {"Tor Öffnen/Schließen"})
local tor = createObject ( 3037, 1093.923828125, 1729.8994140625, 12.10000038147, 0, 0, 0)

local keyPadState2 = 0
local hebebuneMoving2 = false


function keyPad_func2(theButton, theState, thePlayer)
	local pX, pY, pZ = getElementPosition(thePlayer)
	if theButton == "left" and theState == "down" then
		if hebebuneMoving2 == false then
			if isElement(source) and getElementData(thePlayer, "job") == 1 then
				if source == keypad3 or source == keypad4 then
					if getDistanceBetweenPoints3D(1094, 1735.400390625, 11.39999961853, pX, pY, pZ ) < 10 or getDistanceBetweenPoints3D(1092.400390625, 1724, 11.39999961853, pX, pY, pZ ) < 10 then
						if keyPadState2 == 0 then
							moveObject(tor, 2500, 1093.923828125, 1729.8994140625, 12.10000038147)
							keyPadState2 = 1
							hebebuneMoving2 = true
							setTimer(
								function()
									hebebuneMoving2 = false
								end, 2500, 1)
						elseif keyPadState2 == 1 then
							moveObject(tor, 2500, 1093.923828125, 1729.8994140625, 7.6999998092651)
							keyPadState2 = 0
							hebebuneMoving2 = true
							setTimer(
								function()
									hebebuneMoving2 = false
								end, 2500, 1)
						end
					end
				end
			end
		end
	end
end
addEventHandler("onElementClicked", getRootElement(), keyPad_func2)


--- Hebebühnen-Script für Ares bezüglich TÜV

-- Hebebühne 1 - Lastkraftwagen, ...

local buehne1 = createObject( 984, 1112.9699707031, 1716.1999511719, 9.8299999237061, 0, 90, 90 )
local buehne2 = createObject( 984, 1113, 1719.4000244141, 9.8299999237061, 0, 90, 270 )
local buehne1_key = createObject( 2886, 1108.5, 1715.1999511719, 11, 0, 0, 270 )
setElementData( buehne1_key, "cinfo", {"Hebebühne hoch/runter"} )

function ares_buehne1_func ( button, state, player )
	if getElementData( player, "job" ) ~= 1 then return end
		if getElementData( buehne1, "moving" ) and getElementData( buehne2, "moving" ) == true then return end
			setElementData( buehne1, "moving", true )
			setElementData( buehne2, "moving", true )
			setTimer( setElementData, 2600, 1, buehne1, "moving", false )   
			setTimer( setElementData, 2600, 1, buehne2, "moving", false )  
		if getElementData( buehne1, "state" ) and getElementData( buehne2, "state" ) == "open" then
			moveObject( buehne1, 2500, 1112.9699707031, 1716.1999511719, 9.8299999237061 )
			moveObject( buehne2, 2500, 1113, 1719.4000244141, 9.8299999237061 )
			setElementData( buehne1, "state", "closed" )
			setElementData( buehne2, "state", "closed" )
	else
		moveObject( buehne1, 2500, 1112.9699707031, 1716.1999511719, 12.300000190735 )
		moveObject( buehne2, 2500, 1113, 1719.4000244141, 12.300000190735 )
		setElementData( buehne1, "state", "open" )
		setElementData( buehne2, "state", "open" )
	end
end
addEventHandler( "onElementClicked", buehne1_key, ares_buehne1_func )


-- Hebebühne 2 - Porsonenkraftwagen, ...

local buehne3 = createObject( 984, 1114.9697265625, 1710.7001953125, 9.8299999237061, 0, 90, 90 )
local buehne4 = createObject( 984, 1115, 1712.6999511719, 9.8299999237061, 0, 90, 270 )
local buehne2_key = createObject( 2886, 1110.0999755859, 1709.6999511719, 11, 0, 0, 270 )
setElementData( buehne2_key, "cinfo", {"Hebebühne hoch/runter"} )

function ares_buehne2_func ( button, state, player )
	if getElementData( player, "job" ) ~= 1 then return end
		if getElementData( buehne3, "moving" ) and getElementData( buehne4, "moving" ) == true then return end
			setElementData( buehne3, "moving", true )
			setElementData( buehne4, "moving", true )
			setTimer( setElementData, 2600, 1, buehne3, "moving", false )   
			setTimer( setElementData, 2600, 1, buehne4, "moving", false )  
		if getElementData( buehne3, "state" ) and getElementData( buehne4, "state" ) == "open" then
			moveObject( buehne3, 2500, 1114.9697265625, 1710.7001953125, 9.8299999237061 )
			moveObject( buehne4, 2500, 1115, 1712.6999511719, 9.8299999237061 )
			setElementData( buehne3, "state", "closed" )
			setElementData( buehne4, "state", "closed" )
	else
		moveObject( buehne3, 2500, 1114.9697265625, 1710.7001953125, 12.30000019073 )
		moveObject( buehne4, 2500, 1115, 1712.6999511719, 12.30000019073 )
		setElementData( buehne3, "state", "open" )
		setElementData( buehne4, "state", "open" )
	end
end
addEventHandler( "onElementClicked", buehne2_key, ares_buehne2_func )


-- Hebebühne 3 - Motorräder (Bikes, ...)

local buehne5 = createObject( 983, 1113.5, 1706.6999511719, 9.8299999237061, 0, 90, 270 )
local buehne5_key = createObject( 2886, 1110.6999511719, 1705.6999511719, 11, 0, 0, 270 )
setElementData( buehne5_key, "cinfo", {"Hebebühne hoch/runter"} )

function ares_buehne3_func ( button, state, player )
	if getElementData( player, "job" ) ~= 1 then return end
		if getElementData( buehne5, "moving" ) == true then return end
			setElementData( buehne5, "moving", true )
			setTimer( setElementData, 2600, 1, buehne5, "moving", false )   
		if getElementData( buehne5, "state" ) == "open" then
			moveObject( buehne5, 2500, 1113.5, 1706.6999511719, 9.8299999237061 )
			setElementData( buehne5, "state", "closed" )
	else
		moveObject( buehne5, 2500, 1113.5, 1706.6999511719, 12.30000019073 )
		setElementData( buehne5, "state", "open" )
	end
end
addEventHandler( "onElementClicked", buehne5_key, ares_buehne3_func )

-----------------------------------------------------------------------------------------------------------------------

---- Car4You
local keypad_c4y_1 = createObject( 2886, 925.6, -1214.8, 18, 0, 0, 90 )
local keypad_c4y_2 = createObject( 2886, 921.4, -1227.6, 18, 0, 0, 270 )
setElementData(keypad_c4y_1, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(keypad_c4y_2, "cinfo", {"Tor Öffnen/Schließen"})
local tor = createObject ( 16773, 923.6, -1221.1, 18.9, 0, 0, 90 )

local keyPadState4 = 0
local hebebuneMoving4 = false


function keyPad_func4(theButton, theState, thePlayer)
	local pX, pY, pZ = getElementPosition(thePlayer)
	if theButton == "left" and theState == "down" then
		if hebebuneMoving4 == false then
			if isElement(source) and getElementData(thePlayer, "job") == 11 then
				if source == keypad_c4y_1 or source == keypad_c4y_2 then
					if getDistanceBetweenPoints3D( 925.6, -1214.8, 18, pX, pY, pZ ) < 10 or getDistanceBetweenPoints3D( 921.4, -1227.6, 18, pX, pY, pZ ) < 10 then
						if keyPadState4 == 0 then
							moveObject(tor, 2500, 923.6, -1221.1, 5.9 )
							keyPadState4 = 1
							hebebuneMoving4 = true
							setTimer(
								function()
									hebebuneMoving4 = false
								end, 2500, 1)
						elseif keyPadState4 == 1 then
							moveObject(tor, 2500, 923.6, -1221.1, 18.9 )
							keyPadState4 = 0
							hebebuneMoving4 = true
							setTimer(
								function()
									hebebuneMoving4 = false
								end, 2500, 1)
						end
					end
				end
			end
		end
	end
end
addEventHandler("onElementClicked", getRootElement(), keyPad_func4)

local keypad_c4y_3 = createObject( 2886, 881.3, -1162.3, 17.8, 0, 0, 270 )
local keypad_c4y_4 = createObject( 2886, 881.5, -1171.2, 18.4, 0, 0, 90 )
setElementData(keypad_c4y_3, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(keypad_c4y_4, "cinfo", {"Tor Öffnen/Schließen"})
local tor = createObject ( 3037, 881.4, -1166.7, 18, 0, 0, 0 )

local keyPadState5 = 0
local hebebuneMoving5 = false


function keyPad_func5(theButton, theState, thePlayer)
	local pX, pY, pZ = getElementPosition(thePlayer)
	if theButton == "left" and theState == "down" then
		if hebebuneMoving5 == false then
			if isElement(source) and getElementData(thePlayer, "job") == 11 then
				if source == keypad_c4y_3 or source == keypad_c4y_4 then
					if getDistanceBetweenPoints3D( 881.3, -1162.3, 17.8, pX, pY, pZ ) < 10 or getDistanceBetweenPoints3D( 881.5, -1171.2, 18.4, pX, pY, pZ ) < 10 then
						if keyPadState5 == 0 then
							moveObject(tor, 2500, 881.4, -1166.7, 13.9 )
							keyPadState5 = 1
							hebebuneMoving5 = true
							setTimer(
								function()
									hebebuneMoving5 = false
								end, 2500, 1)
						elseif keyPadState5 == 1 then
							moveObject(tor, 2500, 881.4, -1166.7, 18 )
							keyPadState5 = 0
							hebebuneMoving5 = true
							setTimer(
								function()
									hebebuneMoving5 = false
								end, 2500, 1)
						end
					end
				end
			end
		end
	end
end
addEventHandler("onElementClicked", getRootElement(), keyPad_func5)

-----------------------------------------------------------------------------------------------------------------------

---- AutoScout45
local keypad_as45_1 = createObject( 2886, -1965.25, 264.7, 36.6, 0, 0, 90 )
local keypad_as45_2 = createObject( 2886, -1966.8, 252.9, 36.6, 0, 0, 270 )
setElementData(keypad_as45_1, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(keypad_as45_2, "cinfo", {"Tor Öffnen/Schließen"})
local tor = createObject ( 16773, -1966.1, 258.7, 35, 0, 0, 90 )

local keyPadStateas4 = 0
local hebebuneMovingas4 = false

function keyPad_funcas4(theButton, theState, thePlayer)
	local pX, pY, pZ = getElementPosition(thePlayer)
	if theButton == "left" and theState == "down" then
		if hebebuneMovingas4 == false then
			if isElement(source) and getElementData(thePlayer, "job") == 5 then
				if source == keypad_as45_1 or source == keypad_as45_2 then
					if getDistanceBetweenPoints3D( -1965.25, 264.7, 36.6, pX, pY, pZ ) < 10 or getDistanceBetweenPoints3D( -1966.8, 252.9, 36.6, pX, pY, pZ ) < 10 then
						if keyPadStateas4 == 0 then
							moveObject(tor, 2500, -1966.1, 258.7, 30 )
							keyPadStateas4 = 1
							hebebuneMovingas4 = true
							setTimer(
								function()
									hebebuneMovingas4 = false
								end, 2500, 1)
						elseif keyPadStateas4 == 1 then
							moveObject(tor, 2500, -1966.1, 258.7, 35 )
							keyPadStateas4 = 0
							hebebuneMovingas4 = true
							setTimer(
								function()
									hebebuneMovingas4 = false
							end, 2500, 1)
						end
					end
				end
			end
		end
	end
end
addEventHandler("onElementClicked", getRootElement(), keyPad_funcas4)

--------------------------------------------------------------------------------------------------------

local keypad_as45_3 = createObject( 2886, -1939.95, 266, 42.2, 0, 0, 90 )
local keypad_as45_4 = createObject( 2886, -1941.5, 266, 42.2, 0, 0, 270 )
setElementData(keypad_as45_3, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(keypad_as45_4, "cinfo", {"Tor Öffnen/Schließen"})
local tor = createObject ( 16773, -1940.3, 272.2, 40.5, 0, 0, 90 )

local keyPadStateas5 = 0
local hebebuneMovingas5 = false


function keyPad_funcas5(theButton, theState, thePlayer)
	local pX, pY, pZ = getElementPosition(thePlayer)
	if theButton == "left" and theState == "down" then
		if hebebuneMovingas5 == false then
			if isElement(source) and getElementData(thePlayer, "job") == 5 then
				if source == keypad_as45_3 or source == keypad_as45_4 then
					if getDistanceBetweenPoints3D( -1939.95, 266, 42.2, pX, pY, pZ ) < 10 or getDistanceBetweenPoints3D( -1941.5, 266, 42.2, pX, pY, pZ ) < 10 then
						if keyPadStateas5 == 0 then
							moveObject(tor, 2500, -1940.3, 272.2, 30.0 )
							keyPadStateas5 = 1
							hebebuneMovingas5 = true
							setTimer(
								function()
									hebebuneMovingas5 = false
								end, 2500, 1)
						elseif keyPadStateas5 == 1 then
							moveObject(tor, 2500, -1940.3, 272.2, 40.5 )
							keyPadStateas5 = 0
							hebebuneMovingas5 = true
							setTimer(
								function()
									hebebuneMovingas5 = false
								end, 2500, 1)
						end
					end
				end
			end
		end
	end
end
addEventHandler("onElementClicked", getRootElement(), keyPad_funcas5)