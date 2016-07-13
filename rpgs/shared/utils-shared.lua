--[[
Project: VitaOnline
File: utils-shared.lua
Author(s):	Sebihunter
]]--

gJobData = {
	[0] = { name = "Arbeitslos", 				skin0 =  0,	  skin1 =  0, 	skin2 =  0, 	px = 0.0,     py = 0.0,     pz = 0.0 },	
	[1] = { name = "Ares Mitarbeiter",			skin0 =  187, skin1 =  187, skin2 =  187, 	px = 1089.4,  py = 1738.2,  pz = 10.8,		bankname = "Autohaus" },
	[2] = { name = "InterTrans Mitarbeiter", 	skin0 =  161, skin1 =  72,  skin2 =  125,	px =  1581.7, py = 2407.3,  pz = 10.8,		bankname = "InterTrans"  },
	[3] = { name = "Polizist", 					skin0 =  282, skin1 =  288, skin2 =  283, 	px = 257.0,   py = 69.6,    pz = 1003.6,	bankname = "Polizei"  },
	[4] = { name = "Mechaniker", 				skin0 =  268, skin1 =  305, skin2 =  50, 	px = 1696.5,  py =  745.9,  pz = 10.3, 		bankname = "Autofix"  },
	[5] = { name = "AutoScout45 Mitarbeiter", 	skin0 =  98,  skin1 =  98,  skin2 =  98, 	px = -1952.2, py = 304.2,   pz = 35.5, 		bankname = "AutoScout45"  },
	[6] = { name = "Staatsbeamter", 			skin0 =  147, skin1 =  147, skin2 =  147, 	px = 307.1,   py = 66.6,    pz = 1019.2, 	bankname = "Beamter" 	  },
	[7] = { name = "Rettungskraft", 			skin0 =  277, skin1 =  278, skin2 =  279, 	px = 356.1,   py = 317.9,   pz = 1020.1, 	bankname = "Krankenhaus" },
	[8] = { name = "Feuerwehrmann", 			skin0 =  277, skin1 =  278, skin2 =  279, 	px = 356.1,   py = 317.9,   pz = 1010.1,	bankname = "Feuerwehr"   },
	[9] = { name = "Reporter", 					skin0 =  93,  skin1 =  188, skin2 =  186, 	px = 363.2,   py = 171.9,   pz = 1025.7, 	bankname = "Reporter"    },
	[10] = { name = "Fahrlehrer", 				skin0 =  71,  skin1 =  71,  skin2 =  71, 	px = -2033.4, py = -117.4,  pz = 1035.17,   	bankname = "Fahrlehrer"  },
	[11] = { name = "Car4you Mitarbeiter", 		skin0 =  98,  skin1 =  98,  skin2 =  98, 	px = 925.1,   py = -1192.1, pz = 17.0, 		bankname = "Car4you"     }
}

function removeColorCoding ( name, nocentiseconds )
	return type(name)=='string' and string.gsub ( name, '#%x%x%x%x%x%x', '' ) or name
end


function isOwner(name, ownerstring)
	if not ownerstring then return end
	local ownerTable = split(ownerstring, string.byte(','))
	if not ownerTable or not type(ownerTable) == "table" then return end
	for k,v in ipairs(ownerTable) do
		if v == name then
			return true
		end
	end
	return false
end


function getAttachedPosition(x, y, z, rx, ry, rz, distance, angleAttached, height)
 
    local nrx = math.rad(rx);
    local nry = math.rad(ry);
    local nrz = math.rad(angleAttached - rz);
    
    local dx = math.sin(nrz) * distance;
    local dy = math.cos(nrz) * distance;
    local dz = math.sin(nrx) * distance;
    
    local newX = x + dx;
    local newY = y + dy;
    local newZ = (z + height) - dz;
    
    return newX, newY, newZ;
end

function xmlSetNode(xmlfile, nodename, nodeval)
	local thenode = xmlFindChild(xmlfile, nodename, 0)
	if not thenode then
		local newnode = xmlCreateChild(xmlfile, nodename)
		xmlNodeSetValue(newnode, tostring(nodeval))
		return newnode
	else
		xmlNodeSetValue(thenode, tostring(nodeval))
		return thenode
	end	
	return false
end

function oneNodeEdit(xmlfile, nodename, nodeval)
	local xml = xmlLoadFile(xmlfile)
	xmlSetNode(xml, nodename, nodeval)
	xmlSaveFile(xml)
	xmlUnloadFile(xml)
end

function oneNodeGet(xmlfile, nodename)
	local xml = xmlLoadFile(xmlfile)
	local find = xmlFindChild(xml, nodename, 0)
	local val = xmlNodeGetValue(find)
	xmlSaveFile(xml)
	xmlUnloadFile(xml)
	return val
end

function xmlGetVal(xmlfile, nodename)
	local find = xmlFindChild(xmlfile, nodename, 0)
	local val = xmlNodeGetValue(find)
	if val then return val end
	return false
end


function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
 
	return false
end

function getPlayerFromName2(name, rangeXorEle, rangeYorDistance, rangeZ, distance)
	if not name then return nil end
	local ptable = getElementsByType("player")
	
	if rangeXorEle then
		local col 
		if isElement(rangeXorEle) then
			col = createColSphere(getElementPosition(rangeXorEle), rangeYorDistance)
		else
			col = createColSphere(rangeXorEle, rangeYorDistance, rangeZ, distance)
		end
		ptable = getElementsWithinColShape(col, "player")
	end
	local player = getPlayerFromName(name)
	if player then
		return player 
	end
	name = string.lower(name)
	local p = {}
	for index, player in pairs(getElementsByType("player")) do
		if string.find(string.lower(getPlayerName(player)), name) then
			p[#p+1] = player
		end
	end
	if #p == 0 then
		return nil
	elseif #p == 1 then
		return p[1]
	else
		return p
	end
end

function isInRange(range, x, y, z, x2, y2, z2)
	local xele
	local yele
	if isElement(x) then
		xele = x
	end
	if isElement(y) then
		yele = y
	end
	if xele then
		x, y, z = getElementPosition(xele)
	end
	if yele then 
		x2, y2, z2 = getElementPosition(yele)
	end
	return (getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) <= range)
end

function isPlayerOnline(playername)
	local p = getPlayerFromName(playername)
	if not p then return false end
	return (getElementData(p, "isPlayerLoggedIn") == true)
end

function getJobRangNameFromID(jobid)
	local jobrang
	if jobid == 0 then
		jobrang = "Azubi"
	elseif jobid == 1 then
		jobrang = "Angestellter"
	elseif jobid == 2 then       
		jobrang = "Vorgesetzter"
	else
		jobrang = false
	end
	return jobrang
end

-- Datei erstellen oder laden
function fileOpenOrCreate(filepath, readonly)
	local pFile = fileOpen(filepath, readonly)
	if not pFile then
		pFile = fileCreate(filepath)
	end
	return pFile
end

-- XML Datei erstellen oder laden
function xmlCreateOrLoad(fname, rootnode)
	local node = xmlLoadFile(fname)
	if node == false then
		return xmlCreateFile(fname, rootnode)
	else 
		return node
	end
end

-- Elementdatas aus Table laden / schreiben
function setElementDataTable(element, datatable)
	for k, v in pairs(datatable) do
		setElementData(element, k, v)
	end
end

getElementDataTable = getAllElementData

--Punkte aus dem Namen entfernen
function getNameWithoutDots(name)
	return string.gsub(name,"%.", " ", 1)
end

--Gibt das Firmenkonto für eine JobID aus
function getJobBankName(jobid)
	local jobname = false
	if gJobData[jobid].bankname then jobname = gJobData[jobid].bankname end
	return jobname
end

function msToTimeStr(ms, nocentiseconds)
	if not ms then
		return ''
	end
	local centiseconds = tostring(math.floor(math.fmod(ms, 1000)/10))
	if #centiseconds == 1 then
		centiseconds = '0' .. centiseconds
	end
	local s = math.floor(ms / 1000)
	local seconds = tostring(math.fmod(s, 60))
	if #seconds == 1 then
		seconds = '0' .. seconds
	end
	local minutes = tostring(math.floor(s / 60))
	if nocentiseconds then
		return minutes .. ':' .. seconds
	else
		return minutes .. ':' .. seconds .. ':' .. centiseconds
	end
end
