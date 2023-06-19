local sx,sy = guiGetScreenSize()
local px,py = 1366,768
local x,y =  (sx/px), (sy/py) 
local nitrof = isVehicleNitroRecharging ( vehicle, theVehicle )
local dxfont1_font = dxCreateFont("Images/fonte.ttf", 12)
function Vel()
local vehicle = getPedOccupiedVehicle( getLocalPlayer() )
    if ( vehicle ) then
	    local speedX, speedY, speedZ = getElementVelocity ( vehicle  )
	    local actualSpeed = (speedX^2 + speedY^2 + speedZ^2)^(0.5) 
	    local KMH = math.floor(actualSpeed*180)	
	        if ( getElementHealth( vehicle ) >= 1000 ) then
            vehsaude = 100
	        else
	        vehsaude = math.floor(getElementHealth ( vehicle )/10)
	end
        dxDrawRectangle(x*1134, y*710, x*222, y*32, tocolor(0, 0, 0, 100), false)
       -- dxDrawRectangle(x*1140, y*715, x*211, y*20, tocolor(0, 42, 57, 230), false)
	if KMH < 250 then
        dxDrawRectangle(x*1140, y*716, x*211/250*KMH, y*19, tocolor(5, 106, 204, 255), false)
	else
	--	dxDrawRectangle(x*1140, y*716, x*211, y*19, tocolor(0, 175, 240, 230), false)
	end
        dxDrawText(KMH.." KM/h", x*1140, y*715, x*1351, y*735, tocolor(254, 254, 254, 227), 1.00, dxfont1_font, "center", "center", false, false, false, false, false)
        dxDrawRectangle(x*1134, y*674, x*222, y*32, tocolor(0, 0, 0, 100), false)
        dxDrawImage(x*1055, y*674, x*71, y*32, "Images/1.png", 0, 0, 0, tocolor(255, 255, 255, 170), false)
       -- dxDrawRectangle(x*1134, y*638, x*222, y*32, tocolor(0, 0, 0, 150), false)
       -- dxDrawImage(x*1083, y*638, x*51, y*32, "Images/2.png", 0, 0, 0, tocolor(255, 255, 255, 170), false)
		
       -- dxDrawRectangle(x*1140, y*645, x*211/100*vehsaude, y*19, tocolor(254, 19, 19, 227), false)
	
	local car = getPedOccupiedVehicle(localPlayer)
	local nitro = getVehicleNitroLevel(car)
	if nitro ~= false and nitro ~= nil and nitro > 0 then
        dxDrawRectangle(x*1140, y*680, x*211/1*nitro, y*19, tocolor(5, 106, 204, 255), false)
        dxDrawText("Nitro: "..(math.floor(nitro/1*100)), x*1140, y*679, x*1351, y*699, tocolor(254, 254, 254, 227), 1.00, dxfont1_font, "center", "center", false, false, false, false, false)
	else
        dxDrawText("Sem Nitro", x*1140, y*679, x*1351, y*699, tocolor(254, 254, 254, 227), 1.00, dxfont1_font, "center", "center", false, false, false, false, false)
	end
    --    dxDrawText("Dano: "..vehsaude, x*1140, y*644, x*1351, y*664, tocolor(254, 254, 254, 227), 1.00, "default-bold", "center", "center", false, false, false, false, false)
     dxDrawImage(x*1098, y*710, x*33, y*32, "Images/3.png", 0, 0, 0, tocolor(255, 255, 255, 170), false)
	end
end
addEventHandler("onClientRender", root, Vel)