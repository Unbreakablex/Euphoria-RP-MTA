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
			triggerServerEvent("comprarVehiculo", resourceRoot, getLocalPlayer(), vName, tonumber(tabVeh[indexV].p), tonumber(getVehicleModelFromName( tabVeh[indexV].m )), 1)
			
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

addEvent("abrirconce", true)    
addEventHandler("abrirconce", root, 
	function(isvp)
		
		isVIP = isvp
		indexV = 1
		tabVeh = exports.vehicles_auxiliar:getDatos(autos) or {}
		isViewVeh = false

		vehTest = Vehicle(getVehicleModelFromName(tabVeh[indexV].m), 1321.0947265625, 420.4375, 20.718496322632 )
		vehTest.dimension = 0
		setElementFrozen(vehTest, 1000)
		setCameraMatrix( 1333.5693359375, 427.8232421875, 23.718496322632, 1321.0947265625, 420.4375, 20.718496322632, 0, 70 )
		 
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


--[[
function abrirGUIConcesionario (vip)
	if vPrev and isElement(vPrev) then destroyElement(vPrev) end
	triggerEvent("onCursor", getLocalPlayer())
	ventanaConce = guiCreateWindow(400, 95, 594, 558, "Concesionario de vehículos nuevos - San Fernando", false)
	guiWindowSetSizable(ventanaConce, false)
	lAyuda = guiCreateLabel(36, 32, 519, 164, "Bienvenido al concesionario de vehículos nuevos. Puedes comprar un vehículo con préstamo o en efectivo, se te cobrará cada PayDay una cantidad de impuestos.", false, ventanaConce)
	guiLabelSetHorizontalAlign(lAyuda, "center", true)
	gridConce = guiCreateGridList(36, 220, 399, 304, false, ventanaConce)
	guiGridListAddColumn(gridConce, "Modelo", 0.22)
	guiGridListAddColumn(gridConce, "Precio", 0.22)
	guiGridListAddColumn(gridConce, "Entrada Préstamo", 0.22)
	guiGridListAddColumn(gridConce, "Impuestos", 0.22)
	bCerrarConce = guiCreateButton(447, 223, 137, 38, "Cerrar ventana", false, ventanaConce)
	--bConceCompraA = guiCreateButton(447, 271, 137, 38, "Comprar en efectivo (opción A)", false, ventanaConce)
	bConceCompraB = guiCreateButton(447, 319, 137, 38, "Comprar en efectivo ", false, ventanaConce)
	bConcePrev = guiCreateButton(447, 415, 137, 38, "Previsualizar vehículo.", false, ventanaConce)
	addEventHandler('onClientGUIClick', bCerrarConce, regularBotonesConce)
	--addEventHandler('onClientGUIClick', bConceCompraA, regularBotonesConce)
	addEventHandler('onClientGUIClick', bConceCompraB, regularBotonesConce)
	addEventHandler('onClientGUIClick', bConceCompraBPre, regularBotonesConce)
	addEventHandler('onClientGUIClick', bConcePrev, regularBotonesConce)
	addEventHandler('onClientGUIClick', bAyuda, regularBotonesConce)
	rAct = 0
	for k, v in ipairs(exports.vehicles_auxiliar:getDatos()) do
		guiGridListAddRow(gridConce)
		guiGridListSetItemText(gridConce, rAct, 1, tostring(v.m), false, false)
		if vip == true then
			--guiGridListSetItemText(gridConce, rAct, 2, tostring(math.floor((v.p*5)*0.75)), false, false)
			--guiGridListSetItemText(gridConce, rAct, 3, tostring(math.floor(v.p*0.75)), false, false)
			--guiGridListSetItemText(gridConce, rAct, 4, tostring(math.floor(v.p*0.1667)), false, false)
		else
			guiGridListSetItemText(gridConce, rAct, 2, tostring(v.p), false, false)
			guiGridListSetItemText(gridConce, rAct, 3, tostring(v.p*0.3), false, false)
			local clase = exports.vehicles_auxiliar:getClaseFromModel(tostring(v.m))
			guiGridListSetItemText(gridConce, rAct, 4, tostring(impVeh[clase]), false, false)
		end
		if v.vip == true then
			guiGridListSetItemColor(gridConce, rAct, 1, 180, 0, 255)
			guiGridListSetItemColor(gridConce, rAct, 2, 180, 0, 255)
			guiGridListSetItemColor(gridConce, rAct, 3, 180, 0, 255)
			guiGridListSetItemColor(gridConce, rAct, 4, 180, 0, 255)
		end]]
		--[[
		rAct = rAct + 1
	end
end
addEvent("abrirconce", true)    
addEventHandler("abrirconce", root, abrirGUIConcesionario)

function cerrarGUIConce()
	triggerEvent("offCursor", getLocalPlayer())
	destroyElement(ventanaConce)
	setElementData(getLocalPlayer(), "abrirconce", false)
end

function regularBotonesConce()
	if source == bCerrarConce then
		cerrarGUIConce()
	elseif source == bConceCompraA then
		local fila = guiGridListGetSelectedItem ( gridConce )
		if fila == -1 then 
			outputChatBox("Debes seleccionar primero un vehículo de la lista.", 255, 0, 0)
			return
		end
		local model = tostring(guiGridListGetItemText( gridConce, fila, 1))
		local model2 = getVehicleModelFromName(model)
		local precio = tonumber(guiGridListGetItemText( gridConce, fila, 2))
		triggerServerEvent("comprarVehiculo", getLocalPlayer(), getLocalPlayer(), tostring(model), tonumber(precio), tonumber(model2), 1)
		cerrarGUIConce()           
	elseif source == bConceCompraB then
		local fila = guiGridListGetSelectedItem ( gridConce )
		if fila == -1 then 
			outputChatBox("Debes seleccionar primero un vehículo de la lista.", 255, 0, 0)
			return
		end
		local model = tostring(guiGridListGetItemText( gridConce, fila, 1))
		local model2 = getVehicleModelFromName(model)
		local precio = tonumber(guiGridListGetItemText( gridConce, fila, 2))
		triggerServerEvent("comprarVehiculo", getLocalPlayer(), getLocalPlayer(), tostring(model), tonumber(precio), tonumber(model2), 2)
		cerrarGUIConce()
	elseif source == bConceCompraBPre then
		local fila = guiGridListGetSelectedItem ( gridConce )
		if fila == -1 then 
			outputChatBox("Debes seleccionar primero un vehículo de la lista.", 255, 0, 0)
			return
		end
		local model = tostring(guiGridListGetItemText( gridConce, fila, 1))
		local model2 = getVehicleModelFromName(model)
		local precio = tonumber(guiGridListGetItemText( gridConce, fila, 2))
		triggerServerEvent("comprarVehiculoPrestamo", getLocalPlayer(), getLocalPlayer(), tostring(model), tonumber(precio), tonumber(model2))
		cerrarGUIConce()
	elseif source == bConcePrev then
		local fila = guiGridListGetSelectedItem ( gridConce )
		if fila == -1 then 
			outputChatBox("Debes seleccionar primero un vehículo de la lista.", 255, 0, 0)
			return 
		end
		if vPrev and isElement(vPrev) then destroyElement(vPrev) end
		local model = tostring(guiGridListGetItemText( gridConce, fila, 1))
		local model2 = getVehicleModelFromName(model)
		vPrev = createVehicle(model2, 955.33026123047, -2877.6176757812, 1.2599856853485, 0, 0, 186.79515075684)
		outputChatBox("Estás previsualizando un "..tostring(model)..".", 0, 255, 0)
		outputChatBox("Puedes volver al punto para realizar la compra o ver otro vehículo.", 0, 255, 0)
	elseif source == bAyuda then
		cerrarGUIConce()
		triggerServerEvent("onEnviarDudaViaAsistencia", getLocalPlayer(), "No entiendo como funciona la compra de vehículos nuevos.")
		outputChatBox("Acabamos de mandar /duda por ti, espera a que un staff te atienda.", 0, 255, 0)
	end
end
]]