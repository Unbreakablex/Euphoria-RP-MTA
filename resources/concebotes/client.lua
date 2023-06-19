local sx, sy = GuiElement.getScreenSize()
local fontN = DxFont('files/font.otf', 9)
local fontB = DxFont('files/font.otf', 15, true)

local click = false
local isViewVeh = false

local facing = 0
local facingZ = -0.0335

local tabVeh = {}
local indexV = 1

local impVeh = {
	[1] = 0,
	[2] = 450,
	[3] = 150,
	[4] = 150,
	[5] = 100,
	[6] = 150,
	[7] = 175,
	[8] = 125,
	[9] = 100,
	[10] = 50, 
	[11] = 300,
	[12] = 350,
}






function onRender()

	dxDrawRectangle(sx*0.02, sy*0.9, sx*0.27, sy*0.08, tocolor(0,0,0,200), false)

	dxDrawRectangle(sx*0.024, sy*0.91, sx*0.025, sy*0.027, tocolor(255,255,255,255), false)
	dxDrawText2('<', sx*0.024, sy*0.91, sx*0.025, sy*0.027, tocolor(0,0,0,255), 0.7, fontB, 'center', 'center')
	dxDrawText2('Rotar izquierda', sx*0.052, sy*0.91, sx*0.025, sy*0.027, tocolor(255,255,255,255), 1, fontN, 'left', 'center')

	dxDrawRectangle(sx*0.024, sy*0.944, sx*0.025, sy*0.027, tocolor(255,255,255,255), false)
	dxDrawText2('A', sx*0.024, sy*0.944, sx*0.025, sy*0.027, tocolor(0,0,0,255), 0.7, fontB, 'center', 'center')
	dxDrawText2('Vehiculo Anterior', sx*0.052, sy*0.944, sx*0.025, sy*0.027, tocolor(255,255,255,255), 1, fontN, 'left', 'center')

	dxDrawRectangle(sx*0.15, sy*0.91, sx*0.025, sy*0.027, tocolor(255,255,255,255), false)
	dxDrawText2('>', sx*0.15, sy*0.91, sx*0.025, sy*0.027, tocolor(0,0,0,255), 0.7, fontB, 'center', 'center')
	dxDrawText2('Rotar derecha', sx*0.18, sy*0.91, sx*0.025, sy*0.027, tocolor(255,255,255,255), 1, fontN, 'left', 'center')

	dxDrawRectangle(sx*0.15, sy*0.944, sx*0.025, sy*0.027, tocolor(255,255,255,255), false)
	dxDrawText2('D', sx*0.15, sy*0.944, sx*0.025, sy*0.027, tocolor(0,0,0,255), 0.7, fontB, 'center', 'center')
	dxDrawText2('Vehiculo Siguiente', sx*0.18, sy*0.944, sx*0.025, sy*0.027, tocolor(255,255,255,255), 1, fontN, 'left', 'center')


	dxDrawRectangle(sx*0.72, sy*0.83, sx*0.27, sy*0.15, tocolor(0,0,0,180), false)
	--dxDrawRectangle(sx*0.82, sy*0.83, sx*0.17, sy*0.027, tocolor(0,0,0,200), false)



	dxDrawImage(sx*0.965, sy*0.955, sx*0.02, sy*0.025, 'files/eye.png')
	dxDrawImage(sx*0.94, sy*0.955, sx*0.018, sy*0.022, 'files/buy.png')
	dxDrawImage(sx*0.917, sy*0.955, sx*0.016, sy*0.02, 'files/close.png')

	local vName = tabVeh[indexV].nReal or tabVeh[indexV].m
	local vPrecio = tabVeh[indexV].p
	local vVel = tabVeh[indexV].velocidad or 0

	if isVIP then
		vPrecio = math.floor(vPrecio)
	end
	
	dxDrawText2('Modelo: '..vName..'\nVelocidad: '..vVel..' kmh\nCosto: $'..vPrecio, sx*0.83, sy*0.83, sx*0.17, sy*0.15, tocolor(255,255,255,255), 0.6, fontB, 'left', 'center')
	dxDrawText2('Concesionaria', sx*0.82, sy*0.83, sx*0.17, sy*0.027, tocolor(255,255,255,255), 1, fontN, 'center', 'top')

	dxDrawLine( sx*0.82, sy*0.85, sx*0.82, sy*0.85+sy*0.11, tocolor(255,255,255,80), 1, false )
	
	if isElement(vehTest) then

		if not isViewVeh then
			local rx,ry,rz = getElementRotation( vehTest )
			if getKeyState( 'arrow_l' ) then
				setElementRotation(vehTest, rx,ry,rz-5)
			elseif getKeyState( 'arrow_r' ) then
				setElementRotation(vehTest, rx,ry,rz+5)
			end
		end

		if getKeyState( 'a' ) and not keyA then
			if indexV > 1 then
				indexV = indexV - 1
			end
		elseif getKeyState( 'd' ) and not keyD then
			if indexV < #tabVeh then
				indexV = indexV + 1
			end
		end

		if isElement(vehTest) then
			vehTest:setModel(getVehicleModelFromName(tabVeh[indexV].m))
		end
	end

	local text = false

	if isCursorOver(sx*0.965, sy*0.955, sx*0.02, sy*0.025) then

		text = 'Ver Vehiculo'
		if getKeyState('mouse1') and not click then

			if not isViewVeh then
				local x, y, z = getElementPosition(vehTest) 
				setCameraMatrix(x,y,z+0.4, x,y,z-0.4)
			end

			isViewVeh = not isViewVeh
		end

	elseif isCursorOver(sx*0.94, sy*0.955, sx*0.018, sy*0.022) then
		text = 'Comprar Vehiculo'

		if getKeyState('mouse1') and not click then

			local vName = tabVeh[indexV].nReal or tabVeh[indexV].m
			triggerServerEvent("comprarVehiculobotes", resourceRoot, getLocalPlayer(), vName, tonumber(tabVeh[indexV].p), tonumber(getVehicleModelFromName( tabVeh[indexV].m )), 1)
			
			if isElement(vehTest) then
				vehTest:destroy()
			end
			
			setCameraTarget(localPlayer)
			
			removeEventHandler( "onClientRender", getRootElement(),onRender)
			triggerEvent("offCursor", getLocalPlayer())
			showChat(true)
			localPlayer.frozen = false

		end

	elseif isCursorOver(sx*0.917, sy*0.955, sx*0.016, sy*0.02) then
		text = 'Salir'

		if getKeyState('mouse1') and not click then
				
			if isElement(vehTest) then
				vehTest:destroy()
			end
			
			setCameraTarget(localPlayer)
			
			removeEventHandler( "onClientRender", getRootElement(),onRender)
			triggerEvent("offCursor", getLocalPlayer())
			showChat(true)
			localPlayer.frozen = false

		end

	end

	if text then

		if isCursorShowing( ) then
			local cx, cy = getCursorPosition()
			local cx, cy = cx*sx, cy*sy
			local w,h = dxGetTextWidth( text, 1, fontN ), dxGetFontHeight(1, fontN )

			dxDrawRectangle(cx - w/2, cy-h, w, h, tocolor(0,0,0,255), false)
			dxDrawText2(text, cx - w/2, cy-h, w, h, tocolor(255,255,255,255), 1, fontN, 'center', 'top')
		end
	end

	if isViewVeh and isElement(vehTest) then

		local x, y, z = getElementPosition(vehTest)
	    local camX = x + math.cos( facing / math.pi * 180 ) * 5
	    local camY = y + math.sin( facing / math.pi * 180 ) * 5
	    local camZ = z + math.cos( facingZ / math.pi * 180 ) * 5
	    setCameraMatrix( x, y, z+0.4, camX, camY, camZ)
		
	    if getKeyState( 'arrow_l' ) then
	        facing = facing + 0.0005
	    elseif getKeyState( 'arrow_r' ) then
	        facing = facing - 0.0005
	    end

	     if getKeyState( 'arrow_u' ) then
	        facingZ = facingZ + 0.0005
	    elseif getKeyState( 'arrow_d' ) then
	        facingZ = facingZ - 0.0005
	    end

	end

	click = getKeyState('mouse1')
	keyA = getKeyState('a')
	keyD = getKeyState('d')
end
--

addEvent("abrirconcebotes", true)    
addEventHandler("abrirconcebotes", root, 
	function(isvp)
		
		isVIP = isvp
		indexV = 1
		tabVeh = exports.preciosbotes:getDatos() or {}
		isViewVeh = false
		vehTest = Vehicle(getVehicleModelFromName(tabVeh[indexV].m),2490.283203125, -2306.515625, 0.82802844047546 )
		vehTest.dimension = 0
		setElementFrozen(vehTest, 1000)
		setCameraMatrix(2510.0263671875, -2273.98046875, 6.6801948547363,2490.283203125, -2306.515625, 0.82802844047546, 0, 70 )
		---- 33.709178924561, 183.91659545898, 1.200643658638
        ---46.726566314697, 188.9873046875, 5.4984374046326
        
		addEventHandler( "onClientRender", getRootElement(),onRender)
		triggerEvent("onCursor", getLocalPlayer())
		showChat(false)

		localPlayer.frozen = true
	end
)


function isCursorOver(x,y,w,h)
	if isCursorShowing() then
		local sx,sy = guiGetScreenSize(  ) 
		local cx,cy = getCursorPosition(  )
		local px,py = sx*cx,sy*cy
		--local w,h = w-x, h-y
		if (px >= x and px <= x+w) and (py >= y and py <= y+h) then
			return true
		end
	end
	return false
end

function dxDrawText2(t, x,y,w,h, ...)
	return dxDrawText(t, x,y,w+x,h+y, ...)
end