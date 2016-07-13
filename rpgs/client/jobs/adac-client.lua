--[[
Project: VitaOnline
File: adac-client.lua
Author(s):	Sebihunter
			Golf_R32
]]--

local music = playSound3D ( "http://www.top100station.de/switch/top100station_lq.asx", 1660.15,780.64,10.82, true )
setSoundMaxDistance ( music, 100 )


local music = playSound3D ( "http://www.top100station.de/switch/top100station_lq.asx", -1501,702,7, true )
setSoundMaxDistance ( music, 70 )

adackeypad1 = createObject ( 2886, -2038.4478759766, 175.74580383301, 29.151918411255, 0, 0, 90)
adackeypad2 = createObject ( 2886, -2039.2843017578, 174.41404724121, 29.424858093262, 0, 0, 270)
setElementData(adackeypad1, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(adackeypad2, "cinfo", {"Tor Öffnen/Schließen"})

automat1 = createObject(2886,-1515.87890625,687.435546875,7.7287540435791,0,0,90.032958984375)
automat2 = createObject(2886,-1512.4814453125,673.5244140625,7.7287540435791,0,0,269.98901367188)
automat3 = createObject(2886,-1495.0078125,673.5244140625,7.7287540435791,0,0,269.98901367188)
automat4 = createObject(2886,-1500.5966796875,673.5244140625,7.7287540435791,0,0,90.038452148438)
automat5 = createObject(2886,-1529.2822265625,715.466796875,7.6468152999878,0,0,269.98901367188)
automat6 = createObject(2886,-1526.9189453125,726.28125,7.8706483840942,0,0,0)
automat7 = createObject(2886,-1510.9508056641,709.681640625,7.8706483840942,0,0,0)
automat8 = createObject(2886,-1510.9508056641,709.681640625,8.4,0,0,0)
automat11 = createObject(2886,-1510.9508056641,709.681640625,7.27,0,0,0)
automat9 = createObject(2886, -1488.4169921875, 697.60778808594, 12.361784934998, 0, 0, 270.01098632813)
automat10 = createObject(2886, -1488.4067382813, 693.92254638672, 7.6912760734558, 0, 0,270.013671875)	
automat12 = createObject (2886, 1638.66015625, 758.5205078125, 11.5, 0, 0, 90) --Keypad--
automat13 = createObject (2886, 1647.5703125, 758.6904296875, 11.5, 0, 0, 90) --Keypad--
automat14 = createObject (2886, 1656.240234375, 758.58984375, 11.5, 0, 0, 90) --Keypad--
automat15 = createObject (2886, 1664.8896484375, 758.599609375, 11.5, 0, 0, 90) --Keypad--
automat16 = createObject (2886, 1673.6201171875, 758.6435546875, 11.5, 0, 0, 90) --Keypad--
automat17 = createObject (2886, 1682.2998046875, 758.599609375, 11.5, 0, 0, 90) --Keypad--
automat18 = createObject (2886, 1685.9599609375, 759.7099609375, 11.5, 0, 0, 270) --Keypad--
automat19 = createObject (2886, 1741.9443359375, 716.5302734375, 11.5, 0, 0, 0) --Keypad--
setElementData(automat1, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat2, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat3, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat4, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat5, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(automat6, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(automat7, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(automat8, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(automat9, "cinfo", {"Lift benützen"})
setElementData(automat10, "cinfo", {"Lift benützen"})
setElementData(automat11, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat12, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat13, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat14, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat15, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat16, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat17, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat18, "cinfo", {"Hebebühne Bedienen"})
setElementData(automat19, "cinfo", {"Hebebühne Bedienen"})
		
eingangstuerkeyped = createObject(2886,-1521.9501953125,710.4140625,7.9691781997681,0,0,180.36254882813)
ausgangstuerkeyped1 = createObject(2886,-1499.0712890625,709.66796875,7.7055644989014,0,0,0)
keyepdforrepair = createObject(2886, -1505.1313476563, 750.65, 7.6988172531128, 0, 0, 0)
setElementData(eingangstuerkeyped, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(ausgangstuerkeyped1, "cinfo", {"Tor Öffnen/Schließen"})

markertorepairoutside = createMarker(-1498.6203613281,738.26318359375,8.4 , "arrow",1,255,255,0,100)
markertorepairinside = createMarker(-1491.6669921875,747.81781005859,7.8 ,"arrow",1,255,255,0,100)

--DAS IST EIGENTLIHC WERK
lvlagerkeypad1 = createObject (2886, 1714.0302734375, 729.34375, 11, 0, 0, 0)
lvlagerkeypad2 = createObject (2886, 1706.099609375, 730.1796875, 11, 0, 0, 180)
setElementData(lvlagerkeypad1, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(lvlagerkeypad2, "cinfo", {"Tor Öffnen/Schließen"})

--DAS IST EIGENTLIHC LAGER
lvwerkkeypad1 = createObject (2886, 1631.8330078125, 766, 11.60000038147, 0, 0, 270) --Keypad aussen--
lvwerkkeypad2 = createObject (2886, 1633.48046875, 765.900390625, 11.60000038147, 0, 0, 90) --Keypad innen--
setElementData(lvwerkkeypad1, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(lvwerkkeypad2, "cinfo", {"Tor Öffnen/Schließen"})

lveingangkeypad1 = createObject (2886, 1577.40234375, 707.982421875, 11.729040145874, 0, 0, 270) --Keypad aussen--
lveingangkeypad2 = createObject (2886, 1579.0205078125, 718.5048828125, 11.782799720764, 0, 0, 90) --Keypad innen--
setElementData(lveingangkeypad1, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(lveingangkeypad2, "cinfo", {"Tor Öffnen/Schließen"})


lvtor1a = createObject (2886, 1640.599609375, 743.5400390625, 11.60000038147, 0, 0, 0) --Keypad aussen--
lvtor1b = createObject (2886, 1640.7001953125, 745.150390625, 11.60000038147, 0, 0, 180) --Keypad innen--
setElementData(lvtor1a, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(lvtor1b, "cinfo", {"Tor Öffnen/Schließen"})

lvtor2a = createObject (2886, 1649.099609375, 743.5400390625, 11.60000038147, 0, 0, 0) --Keypad aussen
lvtor2b = createObject (2886, 1649.2001953125, 745.150390625, 11.60000038147, 0, 0, 180) --Keypad innen--
setElementData(lvtor2a, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(lvtor2b, "cinfo", {"Tor Öffnen/Schließen"})

lvtor3a = createObject (2886, 1657.7998046875, 743.5400390625, 11.60000038147, 0, 0, 0) --Keypad aussen--
lvtor3b = createObject (2886, 1657.900390625, 745.150390625, 11.60000038147, 0, 0, 180) --Keypad innen--
setElementData(lvtor3a, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(lvtor3b, "cinfo", {"Tor Öffnen/Schließen"})

lvtor4a = createObject (2886, 1666.5, 743.5400390625, 11.60000038147, 0, 0, 0) --Keypad aussen--
lvtor4b = createObject (2886, 1666.599609375, 745.150390625, 11.60000038147, 0, 0, 180) --Keypad innen--
setElementData(lvtor4a, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(lvtor4b, "cinfo", {"Tor Öffnen/Schließen"})

lvtor5a = createObject (2886, 1675.2001953125, 743.5400390625, 11.60000038147, 0, 0, 0) --Keypad aussen--
lvtor5b = createObject (2886, 1675.2998046875, 745.150390625, 11.60000038147, 0, 0, 180) --Keypad innen--
setElementData(lvtor5a, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(lvtor5b, "cinfo", {"Tor Öffnen/Schließen"})

lvtor6a = createObject (2886, 1683.900390625, 743.5400390625, 11.60000038147, 0, 0, 0) --Keypad aussen--
lvtor6b = createObject (2886, 1684, 745.1796875, 11.60000038147, 0, 0, 180) --Keypad innen--
setElementData(lvtor6a, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(lvtor6b, "cinfo", {"Tor Öffnen/Schließen"})

lvtor7a = createObject (2886, 1692.7001953125, 743.5400390625, 11.60000038147, 0, 0, 0) --Keypad aussen--
lvtor7b = createObject (2886, 1692.4697265625, 744.900390625, 11.60000038147, 0, 0, 270) --Keypad innen--
setElementData(lvtor7a, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(lvtor7b, "cinfo", {"Tor Öffnen/Schließen"})

lvschrankeaf1a = createObject (2886, 1740.900390625, 743.5439453125, 11.5, 0, 0, 0) --Keypad aussen--
lvschrankeaf1b = createObject (2886, 1733, 744.27734375, 11.5, 0, 0, 180) --Keypad innen--
setElementData(lvschrankeaf1a, "cinfo", {"Schranke Öffnen/Schließen"})
setElementData(lvschrankeaf1b, "cinfo", {"Schranke Öffnen/Schließen"})

blueheb = createObject( 2886, 94.8, -162.8, 3.1, 0, 0, 90)
setElementData(blueheb, "cinfo", {"Hebebühne Bedienen"})

bluetor1a = createObject( 2886, 89.3, -161.10001, 3.1, 0, 0, 0)
bluetor1b = createObject( 2886, 89.3, -160.85, 3.1, 0, 0, 180)
setElementData(bluetor1a, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(bluetor1b, "cinfo", {"Tor Öffnen/Schließen"})

bluetor2a = createObject( 2886, 99.9, -162.60001, 3.1, 0, 0, 270)
bluetor2b = createObject( 2886, 100.15, -162.60001, 3.1, 0, 0, 90)
setElementData(bluetor2a, "cinfo", {"Tor Öffnen/Schließen"})
setElementData(bluetor2b, "cinfo", {"Tor Öffnen/Schließen"})


local zip1 = createObject(4731, 1637.0999755859,743.46,15,0,0,31)
setObjectScale(zip1, 0.15000002)
replaceTexture(zip1, "diderSachs01", "images/zip_rad.jpg")
setElementCollisionsEnabled (zip1,false )
local zip2 = createObject(4731, 1645,743.4,15,0,0,31)
setObjectScale(zip2, 0.15000002)
replaceTexture(zip2, "diderSachs01", "images/zip_pkw.jpg")
setElementCollisionsEnabled (zip2,false )
local zip3 = createObject(4731, 1653.8,743.4,15,0,0,31)
setObjectScale(zip3, 0.15000002)
replaceTexture(zip3, "diderSachs01", "images/zip_pkw.jpg")
setElementCollisionsEnabled (zip3,false )
local zip4 = createObject(4731, 1662.8000488281,743.40002441406,15,0,0,30.54)
setObjectScale(zip4, 0.15000002)
replaceTexture(zip4, "diderSachs01", "images/zip_pkw.jpg")
setElementCollisionsEnabled (zip4,false )
local zip5 = createObject(4731, 1671.5999755859,743.477,15,0,0,30.40)
setObjectScale(zip5, 0.15000002)
replaceTexture(zip5, "diderSachs01", "images/zip_pkw.jpg")
setElementCollisionsEnabled (zip5,false )
local zip6 = createObject(4731, 1680.4000244141,743.45,15,0,0,30.54)
setObjectScale(zip6, 0.15000002)
replaceTexture(zip6, "diderSachs01", "images/zip_pkw.jpg")
setElementCollisionsEnabled (zip6,false )
local zip7 = createObject(4731, 1688.6999511719,743.45,15,0,0,30.54)
setObjectScale(zip7, 0.15000002)
replaceTexture(zip7, "diderSachs01", "images/zip_lkw.jpg")
setElementCollisionsEnabled (zip7,false )

local zip8 = createObject(4731, 1642.5,574.40002441406,10.39999961853,0,0,30)
setObjectScale(zip8, 0.30000001)
replaceTexture(zip8, "diderSachs01", "images/zip_tuning.jpg")
setElementCollisionsEnabled (zip8,false )
local zip9 = createObject(4731, 1710.5500488281,743.45001220703,16.299999237061,0,0,30)
setObjectScale(zip9, 0.14000000)
replaceTexture(zip9, "diderSachs01", "images/zip_tuning.jpg")
setElementCollisionsEnabled (zip9,false )

--Blueberry Schild
quickfix_blueberry = createObject(4731, 2668.1, -2088, 16.5, 0, 0, 300.25)
setObjectScale(quickfix_blueberry, 1.0)
setElementCollisionsEnabled (quickfix_blueberry,false )
replaceTexture(quickfix_blueberry, "diderSachs01", "images/quickfix.jpg")

local repaircount = 0
local repairdisablewarp = false
local repairanim = 0
showRepairWindow = false

function renderRepair()
	if(showRepairWindow == true) then
		dxDrawRectangle ( screenWidth/2-200, screenHeight/2-100, 400, 200, tocolor ( 0, 0, 0, 150 ) )
		dxDrawText ( "Reparatur", screenWidth/2-200+6, screenHeight/2-100+6, screenWidth, screenHeight, tocolor ( 0, 0, 0, 255 ), 1, "bankgothic" )
		dxDrawText ( "Reparatur", screenWidth/2-200+5, screenHeight/2-100+5, screenWidth, screenHeight, tocolor ( 255, 150, 0, 255 ), 1, "bankgothic" )
		dxDrawText ( "Das Fahrzeug wird repariert, bitte warten.", 1, screenHeight/2-50+1, screenWidth, screenHeight, tocolor ( 0, 0, 0, 255 ), 1, "clear", "center" )
		dxDrawText ( "Das Fahrzeug wird repariert, bitte warten.", 0, screenHeight/2-50, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "clear", "center" )
		dxDrawText ( repaircount.." Sekunden", 1, screenHeight/2+50+1, screenWidth, screenHeight, tocolor ( 0, 0, 0, 255 ), 1, "sans", "center" )
		dxDrawText ( repaircount.." Sekunden", 0, screenHeight/2+50, screenWidth, screenHeight, tocolor ( 255, 255, 255, 255 ), 1, "sans", "center" )
	end
end


function enablewarp (player)
	repairdisablewarp = false
end

bindKey ( "U", "down", function ()
	local playerx, playery,playerz = getElementPosition ( getLocalPlayer( ))
	local hitedx,hittedy,hittedz = getElementPosition(lvwerkkeypad1)
	if getElementData(getLocalPlayer(), "job") == 4 and  getDistanceBetweenPoints3D(hitedx,hittedy,hittedz, playerx, playery,playerz) < 100 then
		triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),11, getLocalPlayer())
	end
end)

function onADACElementClick ( button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement )
	if clickedElement then
		if getElementType ( clickedElement ) == "object" then
			local playerx, playery,playerz = getElementPosition ( getLocalPlayer( ))
			local hitedx,hittedy,hittedz = getElementPosition(clickedElement)
			if getDistanceBetweenPoints3D(hitedx,hittedy,hittedz, playerx, playery,playerz) < 10 then
				if showRepairWindow == false then
					if ( (clickedElement == automat1) and (state == "down")  ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),1,getLocalPlayer())
					elseif ( (clickedElement == automat2) and (state == "down")  ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),2,getLocalPlayer())
					elseif ( (clickedElement == automat3) and (state == "down")  ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),3,getLocalPlayer())	
					elseif ( (clickedElement == automat4) and (state == "down")  ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),4,getLocalPlayer())
					elseif ( (clickedElement == keyepdforrepair) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),5,getLocalPlayer())
					elseif ( (clickedElement == automat5) and (state == "down") ) then
						triggerServerEvent("openthefirstadacdoor", getLocalPlayer(), getLocalPlayer())
					elseif ( (clickedElement == automat8) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),6, getLocalPlayer())
					elseif ( (clickedElement == automat6) and (state == "down") ) then
						triggerServerEvent("openthefirstadacdoor", getLocalPlayer(), getLocalPlayer())
					elseif ( (clickedElement == automat7) and (state == "down") ) then
						triggerServerEvent("openthefirstadacdoor", getLocalPlayer(), getLocalPlayer())
					elseif ( (clickedElement == eingangstuerkeyped) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),6, getLocalPlayer())
					elseif ( (clickedElement == ausgangstuerkeyped1) and (state == "down") ) or ( (clickedElement == automat11) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),7, getLocalPlayer())
					elseif ( (clickedElement == automat9) and (state == "down") ) or ( (clickedElement == automat10) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),8, getLocalPlayer())
					elseif ( (clickedElement == automat12) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),9, getLocalPlayer())
					elseif ( (clickedElement == automat13) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),10, getLocalPlayer())
					elseif ( (clickedElement == lvwerkkeypad1) and (state == "down") ) or ( (clickedElement == lvwerkkeypad2) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),11, getLocalPlayer())
					elseif ( ((clickedElement == lvlagerkeypad1) or (clickedElement == lvlagerkeypad2)) and (state == "down")) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),12, getLocalPlayer())						
					elseif ( (clickedElement == lveingangkeypad1) and (state == "down") ) or ( (clickedElement == lveingangkeypad2) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),14, getLocalPlayer())
					elseif ( (clickedElement == automat14) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),15, getLocalPlayer())
					elseif ( (clickedElement == automat15) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),16, getLocalPlayer())					
					elseif ( (clickedElement == automat16) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),17, getLocalPlayer())									
					elseif ( ((clickedElement == lvtor1a) or (clickedElement == lvtor1b)) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),18, getLocalPlayer())				
					elseif ( ((clickedElement == lvtor2a) or (clickedElement == lvtor2b)) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),19, getLocalPlayer())	
					elseif ( ((clickedElement == lvtor3a) or (clickedElement == lvtor3b)) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),20, getLocalPlayer())	
					elseif ( ((clickedElement == lvtor4a) or (clickedElement == lvtor4b)) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),21, getLocalPlayer())	
					elseif ( ((clickedElement == lvtor5a) or (clickedElement == lvtor5b)) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),22, getLocalPlayer())		
					elseif ( ((clickedElement == lvschrankeaf1a) or (clickedElement == lvschrankeaf1b)) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),23, getLocalPlayer())					
					elseif ( ((clickedElement == bluetor1a) or (clickedElement == bluetor1b)) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),24, getLocalPlayer())				
					elseif ( ((clickedElement == bluetor2a) or (clickedElement == bluetor2b)) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),25, getLocalPlayer())		
					elseif ( (clickedElement == blueheb) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),26, getLocalPlayer())			
					elseif ( (clickedElement == automat17) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),27, getLocalPlayer())		
					elseif ( (clickedElement == automat18) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),28, getLocalPlayer())	
					elseif ( (clickedElement == automat19) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),29, getLocalPlayer())		
					elseif ( ((clickedElement == lvtor6a) or (clickedElement == lvtor6b)) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),30, getLocalPlayer())		
					elseif ( ((clickedElement == lvtor7a) or (clickedElement == lvtor7b)) and (state == "down") ) then
						triggerServerEvent("moveFirstPlateUporDown", getLocalPlayer(),31, getLocalPlayer())								
					end				
				end
			end
			if getDistanceBetweenPoints3D(hitedx,hittedy,hittedz, playerx, playery,playerz) < 10 then
				if ( (clickedElement == theobasdwasd) and (state == "down")  ) then
					triggerServerEvent("adacTorOpen", getLocalPlayer())
				end
			end
			local playerx, playery,playerz = getElementPosition ( getLocalPlayer( ))
			local hitedx,hittedy,hittedz = getElementPosition(clickedElement)
			if getDistanceBetweenPoints3D(hitedx,hittedy,hittedz, playerx, playery,playerz) < 10 then
			end
		end
		local playerx
		local playery
		playerx, playery = getElementPosition ( getLocalPlayer( ))
		if ( (clickedElement == adackeypad1) and (state == "down") and ( getDistanceBetweenPoints2D(-2038.4478759766, 175.74580383301, playerx, playery) < 10) ) then
			triggerServerEvent("ToggleADACTor", getLocalPlayer())
		end
		if ( (clickedElement == adackeypad2) and (state == "down") and ( getDistanceBetweenPoints2D(-2039.2843017578, 174.41404724121, playerx, playery) < 10) ) then
			triggerServerEvent("ToggleADACTor", getLocalPlayer())
		end		
	end
end

addEventHandler ( "onClientClick", getRootElement(), onADACElementClick)

function repairhitthemarkerout(player,dimens)
	if player == getLocalPlayer() then
		if getElementData(getLocalPlayer(), "job") == 4 then
			if repairdisablewarp == false then
				repairdisablewarp = true
				setTimer(enablewarp,2000,1,player)
				fadeCamera(false)
				setTimer(setElementPosition,1000,1,player,-1491.6669921875,747.81781005859,7.6932148933411)
				setTimer(fadeCamera, 1500,1,true)
			end
		end
	end
end

function repairhitthemarkerin(player,dimens)
	if player == getLocalPlayer() then
		if getElementData(getLocalPlayer(), "job") == 4 then
			if repairdisablewarp == false then
				repairdisablewarp = true
				setTimer(enablewarp,2000,1,player)
				fadeCamera(false)
				setTimer(setElementPosition,1000,1,player,-1498.6203613281,738.26318359375,8.2369623184204)
				setTimer(fadeCamera, 1500,1,true)
			end
		end
	end
end
addEventHandler("onClientMarkerHit", markertorepairoutside, repairhitthemarkerout)
addEventHandler("onClientMarkerHit", markertorepairinside, repairhitthemarkerin)

function InitReperatur( repairtime )
   repaircount = repairtime
   repairanim = 0
   setTimer ( ReperaturFunc, 1000, 1 )
   showRepairWindow = true
   addEventHandler("onClientRender", getRootElement(), renderRepair)
   toggleAllControls ( false, true, false )
end
addEvent( "InitReperatur", true )
addEventHandler( "InitReperatur", getRootElement(), InitReperatur )

function ReperaturFunc()
	if repaircount >= 2 then
		repaircount = repaircount-1
		setTimer ( ReperaturFunc, 1000, 1 )
		if repairanim == 0 then
			repairanim = 1
			triggerServerEvent("ADACrepanim", getLocalPlayer(), 0)
		elseif repairanim == 1 then
			repairanim = 2
			triggerServerEvent("ADACrepanim", getLocalPlayer(), 1)
		elseif repairanim == 2 then
			repairanim = 3
			triggerServerEvent("ADACrepanim", getLocalPlayer(), 2)
		elseif repairanim == 3 then
			repairanim = 0
			triggerServerEvent("ADACrepanim", getLocalPlayer(), 3)
		end
	else
		showRepairWindow = false
		removeEventHandler("onClientRender", getRootElement(), renderRepair)
		repaircount = 0
		setElementFrozen ( getLocalPlayer(), false )
		setCameraTarget ( getLocalPlayer() )
		setPedAnimation ( getLocalPlayer() )
		triggerServerEvent("ADACrepfertig", getLocalPlayer())
	end
end
