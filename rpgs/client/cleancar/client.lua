myShader = dxCreateShader( "client/cleancar/texture.fx" )
addEventHandler( "onClientResourceStart", resourceRoot,
function()
    engineApplyShaderToWorldTexture( myShader, "vehiclegrunge256", theVehicle )
    engineApplyShaderToWorldTexture( myShader, "?emap*", theVehicle )
end )