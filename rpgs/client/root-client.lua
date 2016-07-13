--[[
Project: VitaOnline
File: root-client.lua
Author(s):	Golf_R32
			Sebihunter
]]--
-- Version Text
g_version = "1.8"

local lift = playSound3D ("http://www.top100station.de/switch/top100station_lq.asx", 2386, 1385, 0, true )
setSoundMaxDistance ( lift, 25 )

function handleVehicleDamage(attacker, weapon, loss, x, y, z, tyre)
	if getPedOccupiedVehicle(getLocalPlayer()) == source and not weapon and loss >= 50 then
		setElementHealth(getLocalPlayer(), getElementHealth(getLocalPlayer())-loss*0.06)
	end
end
addEventHandler("onClientVehicleDamage", root, handleVehicleDamage)

function syncTime()
	local time = getRealTime( )
	setTime( time.hour, time.minute )
end

function createCustomImages()
	local customblips = {}
	
	local rshad = dxCreateShader("fx/texture2.fx")
    dxSetShaderValue(rshad, "gTexture", dxCreateTexture("images/radardisc.png"))
	engineApplyShaderToWorldTexture(rshad, "radardisc")
	
	local rshad = dxCreateShader("fx/texture.fx")
    dxSetShaderValue(rshad, "gTexture", dxCreateTexture("images/radar_north.png"))
	engineApplyShaderToWorldTexture(rshad, "radar_north")
	
	--- Einkausläden ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 251.7,  -54.5,    20, 20, "images/blips/shop.png" ) 
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2247.7, 2396.5,   20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2333.4, -17.4,    20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1257.7, 204.4,    20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 143.5,  -201.0,   20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 681.6,  -473.7,   20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2090.8, -1905.4,  20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2423.8, -1742.5,  20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1582.3, -1171.0,  20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 875.7,  -1565.1,  20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 685.6,  -1774.8,  20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1000.3, -920.3,   20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2057.8, -2464.4, 20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -1809.9, 902.8,   20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2442.7, 754.4,   20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2510.5, 10.7,    20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2537.5, 2319.0,  20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -19.3,  1175.5,   20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -780.4, 1501.4,   20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -1531.1, 2591.6,  20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -254.6, 2603.4,   20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2546.1, 1972.2,   20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2194.7, 1991.1,   20, 20, "images/blips/shop.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2884.6, 2453.7,   20, 20, "images/blips/shop.png" )
	
	---Donutladen ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2767.5, 788.7,  16, 16, "images/blips/donut.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -144.2,  1224.9, 16, 16, "images/blips/donut.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1936.3,  2318.9, 16, 16, "images/blips/donut.png" )

	--- Burger Shot ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 811.9,   -1616.0, 16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1199.1,  -918.0,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -1912.3, 828.0,   16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2337.0, -166.6,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2356.5, 1008.0,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2366.7,  2071.0,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2472.7,  2033.9,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2169.9,  2795.8,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1872.3,  2072.0,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1158.4,  2072.0,  16, 16, "images/blips/eat.png" )
	
	--- Cluckin' Bell ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 172.7,   1176.68,  16, 16, "images/blips/eat.png" ) 
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -1213.7, 1830.46,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2155.0, -2460.28, 16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2420.0,  -1509.8,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2397.8,  -1898.65, 16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 928.5,   -1352.77, 16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -1815.9, 618.678,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2671.5, 258.344,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2638.6,  1671.18,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2393.2,  2041.66,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2838.4,  2407.26,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2102.7,  2228.76,  16, 16, "images/blips/eat.png" )
	
	--- Well Stacked Pizza ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1367.3, 248.4,   16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2333.4, 75.5,    16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1367.3, 248.4,   16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2105.3, -1806.5, 16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -1808.7, 945.9,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -1721.1, 1359.0, 16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2638.6, 1850.0,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2756.0, 2477.1,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2351.9, 2532.2,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2083.5, 2224.2,  16, 16, "images/blips/eat.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 203.3, -202.5,   16, 16, "images/blips/eat.png" )

	--- Ammunation ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1368.35,  -1279.06,  16, 16, "images/blips/ammu.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2625.85, 208.345,   16, 16, "images/blips/ammu.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 242.668,  -178.478,  16, 16, "images/blips/ammu.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2333.43,  61.5173,   16, 16, "images/blips/ammu.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2159.51,  943.329,   16, 16, "images/blips/ammu.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2539.04,  2083.56,   16, 16, "images/blips/ammu.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 777.231,  1871.47,   16, 16, "images/blips/ammu.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -315.676, 829.868,   16, 16, "images/blips/ammu.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2093.51, -2464.79,  16, 16, "images/blips/ammu.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2400.5,   -1981.48,  16, 16, "images/blips/ammu.png" )
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -1508.89, 2610.8,    16, 16, "images/blips/ammu.png" )
	
	--- Sonstiges ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2019.5, 1007.1, 16, 16,  "images/blips/casino.png" ) 		-- Four Dragons
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2740.4, -2008.8, 24, 24, "images/blips/geld.png" ) 			--Uezguer 
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1899.4, -1426.4, 16, 16, "images/blips/pool.png" ) 			--Strandbad
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2086.0, 2074.0, 16, 16, "images/blips/boobs.png" ) 			--Sexshop
	
	--- Bars ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1906.2, -1358.3, 16, 16, "images/blips/drink.png" ) 		--Freibad Bar
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 886.3, 1915.5, 16, 16, "images/blips/drink.png" ) 			--Wilder Ösi Bar
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1904.7, 1916.2, 16, 16, "images/blips/drink.png" ) 			--PBC Bar
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2042.5, 163.6, 16, 16, "images/blips/drink.png" ) 			--Die Werkstatt
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -960.1, -975.1, 16, 16, "images/blips/drink.png" )			-- Baumhaus
	
	
	--- Polizei ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2285.4, 2430.7, 16, 16, "images/blips/polizei.png" ) 		--Polizei LV
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1548.3, -1675.6, 16, 16, "images/blips/polizei.png" ) 		--Polizei LS
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2360.2, 536.7, 16, 16,  "images/blips/polizei.png" ) 		--Polizei Wasserwacht
	
	--- Autofix ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1672.0, 708.0, 49, 16,  "images/blips/autofix.png" )		--Autofix LV
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -1503.5, 723.6, 49, 16,  "images/blips/autofix.png" ) 		--Autofix SF
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2538.0, -2111.8, 49, 16,  "images/blips/autofix.png" ) 		--Autofix LS
	
	--- Autohäuser ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1064.9, 1754.8, 16, 16,  "images/blips/autohaus.png" )		--Autohaus LV
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -1946.5, 271.3, 16, 16,  "images/blips/sf_auto.png" )		--Autohaus SF
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -1952.2, 304.2, 16, 16,  "images/blips/autohus.png" ) 		--AutoScout45
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 925.1, -1192.1, 17, 16, "images/blips/car4you.png" ) 		--Car4you

	--- Feuerwehr ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2639.4, 1213.8, 16, 16, "images/blips/feuerwehr.png" ) 		-- Feuerwehr LV
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -2025.4, 66.9, 16, 16,  "images/blips/feuerwehr.png" ) 		-- Feuerwehr SF
	
	--- Krankenhaus ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1178.3, -1323.3, 16, 16, "images/blips/kh.png" ) 			--Krankenhaus LS
	
	
	--- Unternehmen ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2007.7, 2182.7, 16, 16, "images/blips/news.png" )				-- Reporter
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1412.1, -1700, 16, 16,  "images/blips/gericht.png" ) 			--Gericht LV
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1481.5, -1768.2, 16, 16, "images/blips/saso.png" ) 				--SASO LV
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1419.4, -1623.8, 16, 16, "images/blips/school.png" ) 			--Fahrschule
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2461.5, -2108.4, 16, 16, "images/blips/autoverwahrung.png" )	--Autoverwahrung
		
	--- User Jobs ---
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 930.7,   -1111.4,  16, 16, "images/blips/rasenmaeherjob.png" )	--Gärtner Job
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1050.9,  2321.7,   16, 16, "images/blips/busjob.png" ) 			--Busjob LV
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1752.7,  -1894.1,  28, 28, "images/blips/taxi.png" ) 			--Taxi
	customblips[#customblips+1] = exports.customblips:createCustomBlip( -485.6, 1134.0,    16, 16, "images/blips/anker.png" ) 			--Fischjob	
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 1643.2,  2322.8,   16, 16, "images/blips/truckerjob.png" )		--Trucker LV
	customblips[#customblips+1] = exports.customblips:createCustomBlip( 2409.0, 1510.9, 16, 16,  "images/blips/trashbin.png" )			--Straßenreiniger
	


	for i,v in ipairs(PaintnSprayIDTab) do
		customblips[#customblips+1] = exports.customblips:createCustomBlip(v.x, v.y, 16, 16, "images/blips/paynspray.png") 		--paynspray
	end
	
	
	for i,v in ipairs(getElementsByType("tankstelle")) do
		local colC = getElementData(v, "colCircle")
		local x,y,_ = getElementPosition(colC)
		customblips[#customblips+1] = exports.customblips:createCustomBlip(x,y, 12, 12, "images/blips/fuel.png") --Tankstelle 	
	end
	
	for i,v in ipairs(customblips) do
		exports.customblips:setCustomBlipStreamRadius ( v, 100 )
	end
	
	loadRadarMarker ()
	
end

function onClientRPGResourceStart()
	
	setPedTargetingMarkerEnabled ( false )
	
	local obj = createObject( 8332, 1398.7998046875, -9.900390625, 1005.0999755859,0, 0, 269.09362792969)
	setObjectScale( obj, 0.5 )
	setElementInterior(obj, 1)
	setElementDoubleSided ( obj, true )
	setElementCollisionsEnabled ( obj, false )
	replaceTexture(obj, "heat_03", "images/gericht.jpg")
	
	--Ampeln disablen
	setTrafficLightState ( 9 )	
	setTrafficLightsLocked(true)	
	

	setGravity ( 0.008 )
	setGameSpeed ( 1 )	
	setElementData(getLocalPlayer(), "isHigh", false)
	
	--createTheLogRegCamera()
	fadeCamera(true)
	setElementData(getLocalPlayer(), "freecam:state", false)
	toggleAllControls ( true )  
	setMinuteDuration( 60000 )
	syncTime( )
	
	for i,v in ipairs(getElementsByType("object")) do
		if getElementModel(v) == 2942 or getElementModel(v) == 2886 then
			setObjectBreakable ( v, false )
		end
	end	
	--setTimer( syncTime, 100000, 0 )
	bindKey("F11", "down", function() 
		if getElementData(getLocalPlayer(), "hideTacho") ~= true then 
			setElementData(getLocalPlayer(), "hideTacho", true)
		else
			setElementData(getLocalPlayer(), "hideTacho", false)
		end
	end
	)
	
	for i,v in ipairs(getElementsByType("vehicle")) do
		if getElementData(v, "siren") then
			triggerEvent ( "toggleSiren", getLocalPlayer(), v, getElementData(v, "siren") )
		end
	end
	bindKey("b", "down", "chatbox", "LOOC" )
	bindKey("x", "down", "chatbox", "Gang" )
	bindKey("m", "down",
		function()
			if getElementData(getLocalPlayer(), "isPlayerLoggedIn") == true then
				showCursor(not isCursorShowing())
			end
		end
	)	
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), onClientRPGResourceStart)

-- Unverwundbares Ped

function onClientPlayerWasted()
	if getElementData(source, "afk") == true then
		cancelEvent()	
	end
end
addEventHandler("onClientPlayerWasted", getRootElement(), onClientPlayerWasted)


function onClientPedWasted()
	if getElementData(source, "isInvincible") then
		cancelEvent()
	end
end
addEventHandler("onClientPedWasted", getRootElement(), onClientPedWasted)

function onClientPlayerDamage(attacker, weapon, bodypart, loss)
	if getElementData(source, "isInvincible") then
		setPedHealth(source,getPedHealth(ped)+loss)
		cancelEvent()
	end
	if source ~= getLocalPlayer() then return end
	if getElementData(source, "afk") == true then
		setElementHealth(source, getElementHealth(source)+loss)
		cancelEvent()	
	end
end
addEventHandler("onClientPlayerDamage", getRootElement(), onClientPlayerDamage)


local g_tooltipTable = {
[1] = "Du kannst auf F1 alle wichtigen Befehle, Tasten, Gesetze und Regeln nachlesen.",
[2] = "Um bei Gangs oder Firmen beizutreten, musst du dich in ihrem Unterforen auf www.villages-town.de bewerben.",
[3] = "Es gibt viele spannende Nebenjobs die keine Bewerbung benötigen.\nInfos dazu findest du in der Stadthalle (gelber Punkt auf 'F11') neben dem LVPD.",
[4] = "Es gibt an mehreren öffentlichen Plätzen (Bahnhöfen, Krankenhäuser) Fahrräder, welche jedem frei zur Verfügung stehen.",
[5] = "Es ist möglich an jedem Bahnhof schnell in eine andere Stadt zu reisen.\nWarte dafür einfach auf den automatischen Zug.",
[6] = "Für das Bekommen des Gehalts benötigst du ein Konto, welches du bei jedem ATM erstellen kannst.",
[7] = "Fahrzeuge können bei den Autohäusern (AutoScout45, Car4you und Ares Automobiles) erworben werden.",
[8] = "Wenn dein Auto kaputt ist, kannst du mit /autofix den Pannendienst rufen.\nBei einem Brand musst du mit /113 auch die Feuerwehr rufen.",
[9] = "Um mit anderen Spielern über eine weite Distanz kommunizieren zu können, kannst du dir in einem Geschäft ein Handy kaufen.",
[10] = "Wenn du im Krankenhaus respawnst verlierst du dein gesamtes Bargeld.\nMit Glück findest du es an deiner letzten Position."
}

g_showTooltip = false
g_tooltipText = ""
g_tooltipPosY = -100
-- showTooltip
-- Zeigt einen Tooltip auf dem Bildschirm des Spielers
function showTooltip(text)
	playSound("sounds/info.mp3")
	g_tooltipText = text
	g_showTooltip = true
	setTimer(function() g_showTooltip = false end, 10000, 1)
end

setTimer(function() showTooltip(g_tooltipTable[math.random(1, #g_tooltipTable)]) end, 5*60*1000, 0)

-- makePlayerExitVehicle
-- Laesst einen Spieler aussteigen
function makePlayerExitVehicle()
	setControlState("enter_exit", true)
end

function hygienePlus(ped)
	if ped == getLocalPlayer() then
		if getElementData(getLocalPlayer(), "getPlayerHygiene") + 5 <= 100 then
			setElementData(getLocalPlayer(), "getPlayerHygiene", getElementData(getLocalPlayer(), "getPlayerHygiene") + 5)
		else
			setElementData(getLocalPlayer(), "getPlayerHygiene", 100)
		end
	end
end
addEventHandler("onClientPlayerHitByWaterCannon", getRootElement(), hygienePlus)

function AlertHandler ( x1, y1, z1, veh )
	local dsound = playSound3D ( "sounds/alarm.mp3", x1, y1, z1, false )
	attachElements ( dsound, veh )
	setSoundVolume ( dsound, 1.0 )
	setSoundMaxDistance ( dsound, 30 )
end
addEvent ( "onServerTriggerAlert", true )
addEventHandler ( "onServerTriggerAlert", getRootElement(), AlertHandler )

local text1LevelUp
local text2LevelUp
local infoProgressLevelUp
local partLevelUp
local alphaProgressLevelUp
local soundPlayedLevelUp
function showLevelUp(text1, text2)
	if not isEventHandlerAdded( "onClientRender", getRootElement(), renderLevelUp ) then
		text1LevelUp = text1
		text2LevelUp = text2
		infoProgressLevelUp = 0
		alphaProgressLevelUp = 0
		soundPlayedLevelUp = false
		playSound("sounds/levelup.mp3")
		addEventHandler("onClientRender", getRootElement(), renderLevelUp, false, "low+1")
		
		--ADD LEVEL UP INFO WHATS NEW WITH A TIMER!!!!
	end
end

function renderLevelUp()
	if 0.35 < infoProgressLevelUp and infoProgressLevelUp < 0.65 then 
		infoProgressLevelUp = infoProgressLevelUp + 0.005
		if infoProgressLevelUp < 0.5 then
			alphaProgressLevelUp = alphaProgressLevelUp + 0.05
		else
			alphaProgressLevelUp = alphaProgressLevelUp - 0.05
		end
	else
		infoProgressLevelUp = infoProgressLevelUp + 0.025
	end
	
	if alphaProgressLevelUp > 1 then alphaProgressLevelUp = 1 elseif alphaProgressLevelUp < 0 then alphaProgressLevelUp = 0 end
	
	if infoProgressLevelUp > 1 then removeEventHandler("onClientRender", getRootElement(), renderLevelUp) end
	
	local x, _, _ = interpolateBetween ( 0, 0, 0, screenWidth, 0, 0, infoProgressLevelUp, "OutInQuad")
	local x2, _, _ = interpolateBetween ( screenWidth, 0, 0, 0, 0, 0, infoProgressLevelUp, "OutInQuad")
	
	dxDrawLine ( screenWidth/2-200, screenHeight/2-16, screenWidth/2+200,screenHeight/2-16, tocolor(0,0,0,alphaProgressLevelUp*255), 1 )
	dxDrawLine ( screenWidth/2-200, screenHeight/2-15, screenWidth/2+200,screenHeight/2-15, tocolor(255,255,255,alphaProgressLevelUp*255), 2 )
	dxDrawLine ( screenWidth/2-200, screenHeight/2-13, screenWidth/2+200,screenHeight/2-13, tocolor(0,0,0,alphaProgressLevelUp*255), 1 )
	dxDrawBackgroundedText ( text1LevelUp, x, screenHeight/2-10, x, screenHeight, tocolor ( 255, 255, 255, 255 ),  tocolor ( 0, 0, 0, 255 ), 2, "default-bold", "center", "top", false, false, false )
	dxDrawBackgroundedText ( text2LevelUp, x2, screenHeight/2+15, x2, screenHeight, tocolor ( 255, 255, 255, 255 ),  tocolor ( 0, 0, 0, 255 ), 2, "default-bold", "center", "top", false, false, false )	
	dxDrawLine ( screenWidth/2-200, screenHeight/2+49, screenWidth/2+200,screenHeight/2+49, tocolor(0,0,0,alphaProgressLevelUp*255), 1 )
	dxDrawLine ( screenWidth/2-200, screenHeight/2+50, screenWidth/2+200,screenHeight/2+50, tocolor(255,255,255,alphaProgressLevelUp*255), 2 )
	dxDrawLine ( screenWidth/2-200, screenHeight/2+52, screenWidth/2+200,screenHeight/2+52, tocolor(0,0,0,alphaProgressLevelUp*255), 1 )
end

-- by Zipper --

local rotX, rotY = 0,0
local camVehRot = 0
local rot = 0
local egoEnabled = false

local lp = getLocalPlayer()

local mouseSensitivity = 0.1

local delay = 0

local function freecamFrame ( slice )

    local camPosX, camPosY, camPosZ = getPedBonePosition ( lp, 8 )
	
	local angleZ = math.sin(rotY)
    local angleY = math.cos(rotY) * math.cos(rotX)
    local angleX = math.cos(rotY) * math.sin(rotX)
	
	local camTargetX = camPosX + ( angleX ) * 100
    local camTargetY = camPosY + angleY * 100
    local camTargetZ = camPosZ + angleZ * 100

    local mspeed = 2
	
    setCameraMatrix ( camPosX, camPosY, camPosZ, camTargetX, camTargetY, camTargetZ )
end

local function freecamMouse (cX,cY,aX,aY)

	if isCursorShowing() or isMTAWindowActive() then
		delay = 5
		return
	elseif delay > 0 then
		delay = delay - 1
		return
	end
	
    local width, height = guiGetScreenSize()
    aX = aX - width / 2 
    aY = aY - height / 2
	
    rotX = rotX + aX * mouseSensitivity * 0.01745
    rotY = rotY - aY * mouseSensitivity * 0.01745
	
	local PI = math.pi
	if rotX > PI then
		rotX = rotX - 2 * PI
	elseif rotX < -PI then
		rotX = rotX + 2 * PI
	end
	
	if rotY > PI then
		rotY = rotY - 2 * PI
	elseif rotY < -PI then
		rotY = rotY + 2 * PI
	end
    if rotY < -PI / 2.05 then
       rotY = -PI / 2.05
    elseif rotY > PI / 2.05 then
        rotY = PI / 2.05
    end
end

function setEgoEnabled (x, y, z)

	if (x and y and z) then
	    setCameraMatrix ( camPosX, camPosY, camPosZ )
	end
	addEventHandler("onClientPreRender", getRootElement(), freecamFrame)
	addEventHandler("onClientRender", getRootElement(), freecamFrame)
	addEventHandler("onClientCursorMove",getRootElement(), freecamMouse)
end

function setEgoDisabled()

	if egoEnabled then
		egoEnabled = false
		removeEventHandler("onClientPreRender", getRootElement(), freecamFrame)
		removeEventHandler("onClientRender", getRootElement(), freecamFrame)
		removeEventHandler("onClientCursorMove",getRootElement(), freecamMouse)
		setCameraTarget ( lp )
	end
end
addEventHandler ( "onClientPlayerWasted", getLocalPlayer(), setEgoDisabled )

function ego_func ()

	if egoEnabled then
		setEgoDisabled()
	else
		egoEnabled = true
		local x, y, z = getElementPosition ( lp )
		setEgoEnabled ( x, y, z )
	end
end
addCommandHandler( "ego", ego_func)