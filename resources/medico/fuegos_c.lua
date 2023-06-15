local fireModel = 2023

function startTheFire (fX,fY,fZ)
    setTimer ( function()
		createFire(fX,fY,fZ,60)
	end, 420000, 1)
    outputDebugString("[Bomberos]: Creando fuego aleatorio en x:"..fX.." y:"..fY.." z:"..fZ)
	
    local Soundone = playSound3D( "alarm/firealarm.mp3", 1227.7978515625, 306.2919921875, 19.704900741577, false )
    setSoundMinDistance(Soundone, 25)
    setSoundMaxDistance(Soundone, 70)
	
	local Soundtwo = playSound3D( "alarm/firealarmsecond.mp3", 502.3583984375, -72.916015625, 998.7578125, false )
	setSoundMinDistance(Soundtwo, 25)
    setSoundMaxDistance(Soundtwo, 70)
	
	local fire = engineLoadDFF("fire.dff",1)
	engineReplaceModel(fire,fireModel)
end
addEvent("startTheFire",true)
addEventHandler( "startTheFire", getRootElement(), startTheFire)