--[[
Project: VitaOnline
File: mysql-server.lua
Author(s):	Werni
]]--
g_mysql = {}
local hasPlayersLoaded = false

function onResourceStartMysqlConnection()
	local xml = xmlLoadFile("./xml/config.xml")
	if not xml then
		outputServerLog("Konnte config.xml nicht finden. Laden abgebrochen!")
		cancelEvent()
		stopResource(getThisResource())
		return false
	end
	
	--MySQL Daten
	local mysqlchild = xmlFindChild(xml, "mysqldata", 0)
	if not mysqlchild then
		outputServerLog("Keine MySQL Verbindungsdaten gefunden.")
	end
	
	local mysqlhost = xmlGetVal(mysqlchild, "host")
	if mysqlhost then mysql_host = mysqlhost end
	
	local mysqluser = xmlGetVal(mysqlchild, "user")
	if mysqluser then mysql_user = mysqluser end
	
	local mysqlpsw = xmlGetVal(mysqlchild, "password")
	if mysqlpsw then mysql_password = mysqlpsw end

	local mysqltable = xmlGetVal(mysqlchild, "table")
	if mysqltable then mysql_table = mysqltable end
	
	g_mysql["connection"] = mysql_connect(mysql_host, mysql_user, mysql_password, mysql_table, 3306, nil, "")

	if not g_mysql["connection"] then
		outputServerLog("Kann die MySQL-Verbindung nicht aufbauen!")
		print("Kann die MySQL-Verbindung nicht aufbauen!")
		stopResource(getThisResource())
		eventcancled = 1
		cancelEvent()
		return false
	end
	
	
	--------CONVERTER 
	if not hasPlayersLoaded == true then
		hasPlayersLoaded = true
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), onResourceStartMysqlConnection)

function onResourceStopMysqlEnd()
	mysql_close(g_mysql["connection"])
end
addEventHandler("onResourceStop", getResourceRootElement(), onResourceStopMysqlEnd, true, "low")