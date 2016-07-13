addCommandHandler("GettoSound", function(player)
	local obj = getElementData(player, "gbObject")
		--if vioGetElementData ( player, "premium" ) then
	if (isElement(obj)) then
		exports.bone_attach:detachElementFromBone(obj)
		destroyElement(obj)
		setElementData(player, "gbObject", nil)
		triggerClientEvent(root, "speaker", player, "stop")
	else
		local gb = createObject(2226, 0, 0, 0)
		exports.bone_attach:attachElementToBone(gb, player, 12, 0, 0, 0.4, 0, 180, 0)
		setElementData(player, "gbObject", gb)
		triggerClientEvent(root, "speaker", player, "play")
		end
	end)
--end