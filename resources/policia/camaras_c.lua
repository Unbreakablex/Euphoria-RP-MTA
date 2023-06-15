-- Sistema de camaras de seguridad.



----- Definición del panel.
function VerCamaras()
		local x,y = guiGetScreenSize()
		local width,height = 450,470
		x = x-width
		y = (y-height)/2
		cams_wnd = guiCreateWindow(x,y,width,height, "Camaras de Seguridad", false)
		button_cam_one = guiCreateButton(38,30,180,30, "Concesionario", false,cams_wnd)
		button_cam_two = guiCreateButton(38,75,180,30, "SASD", false,cams_wnd)
		button_cam_three = guiCreateButton(38,120,180,30, "PCMW", false,cams_wnd)
		button_cam_four = guiCreateButton(38,165,180,30, "Xoomer PC", false,cams_wnd)
		button_cam_five = guiCreateButton(38,210,180,30, "TTL", false,cams_wnd)
		button_cam_six = guiCreateButton(38,255,180,30, "RCWR", false,cams_wnd)
		button_cam_seven = guiCreateButton(38,300,180,30, "Playa", false,cams_wnd)
		button_cam_eight = guiCreateButton(38,345,180,30, "Hospital", false,cams_wnd)
		button_cam_nine = guiCreateButton(38,390,180,30, "Ayuntamiento", false,cams_wnd)
		button_cam_close = guiCreateButton(38,435,180,30, "Cerrar", false,cams_wnd)
		button_vid_normal = guiCreateButton(233,30,180,30, "Normal", false,cams_wnd)
		button_vid_night = guiCreateButton(233,75,180,30, "Nocturna", false,cams_wnd)
		button_vid_teplo = guiCreateButton(233,120,180,30, "Termica", false,cams_wnd)
		showCursor(true)
		setElementFrozen(getLocalPlayer(),true)
end
addEvent("VerCamarasPolicia", true)
addEventHandler("VerCamarasPolicia", getLocalPlayer(), VerCamaras)


-------- Camaras Definidas
addEventHandler("onClientGUIClick",getRootElement(),function()
	if (source == button_vid_normal) then
        setCameraGoggleEffect("normal")
	end
	if (source == button_vid_night) then
        setCameraGoggleEffect("nightvision")
	end
	if (source == button_vid_teplo) then
        setCameraGoggleEffect("thermalvision")
	end
	if (source == button_cam_one) then
        fadeCamera (true)
        setCameraMatrix(231.212890625, 76.412109375, 1005.0390625, 0, 0, 15.982604980469, 0, 70 )
		setElementInterior(getLocalPlayer(),0)
		setElementDimension(getLocalPlayer(),0)
		outputChatBox("Estás vigilando la cámara de seguridad de Concesionario",0,255,0)
	end
	if (source == button_cam_two) then
        fadeCamera (true)
        setCameraMatrix( 2418.390625, 32.0732421875, 34.860622406006, 0, 19.196166992188, 0, 0, 70)
		setElementInterior(getLocalPlayer(),0)
		setElementDimension(getLocalPlayer(),0)
		outputChatBox("Estás vigilando la cámara de seguridad del Sheriff",0,255,0)
	end
	if (source == button_cam_three) then
        fadeCamera (true)
        setCameraMatrix(-1511.4951171875, 779.3291015625, 10.316791534424, -1454.212890625, 858.783203125, -9.8239154815674, 0, 70)
		setElementInterior(getLocalPlayer(),0)
		setElementDimension(getLocalPlayer(),0)
		outputChatBox("Estás vigilando la cámara de seguridad del Concesionario Mufflers",0,255,0)
	end
	if (source == button_cam_four) then
        fadeCamera (true)
        setCameraMatrix(-2018.705078125, 375.248046875, 41.388759613037, -2111.203125, 339.1494140625, 29.513427734375, 0, 70)
		setElementInterior(getLocalPlayer(),0)
		setElementDimension(getLocalPlayer(),0)
		outputChatBox("Estás vigilando la cámara de seguridad de Industrias Xoomer",0,255,0)
	end
	if (source == button_cam_five) then
        fadeCamera (true)
        setCameraMatrix( -2056.546875, -18.58984375, 41.745937347412, -2098.64453125, -105.71484375, 16.507440567017, 0, 70)
		setElementInterior(getLocalPlayer(),0)
		setElementDimension(getLocalPlayer(),0)
		outputChatBox("Estás vigilando la cámara de seguridad de TurboTransLogistic",0,255,0)
	end
	if (source == button_cam_six) then
        fadeCamera (true)
        setCameraMatrix( -2308.5556640625, -81.5556640625, 53.222747802734, -2376.9140625, -131.2490234375, -0.23512749373913, 0, 70)
		setElementInterior(getLocalPlayer(),0)
		setElementDimension(getLocalPlayer(),0)
		outputChatBox("Estás vigilando la cámara de seguridad de Taxistas",0,255,0)
	end
	if (source == button_cam_seven) then
        fadeCamera (true)
        setCameraMatrix(-1693.189453125, -115.44921875, 17.116069793701, -1680.4990234375, -21.48046875, -14.644105911255, 0 , 70)
		setElementInterior(getLocalPlayer(),0)
		setElementDimension(getLocalPlayer(),0)
		outputChatBox("Estás vigilando la cámara de seguridad del Puerto SF",0,255,0)
	end
	if (source == button_cam_eight) then
        fadeCamera (true)
        setCameraMatrix(-2671.357421875, 619.4384765625, 29.240600585938, -2614.69140625, 679.3935546875, -27.277629852295, 0, 70)
		setElementInterior(getLocalPlayer(),0)
		setElementDimension(getLocalPlayer(),0)
		outputChatBox("Estás vigilando la cámara de seguridad del Hospital SF",0,255,0)
	end
	if (source == button_cam_nine) then
        fadeCamera (true)
        setCameraMatrix(-2767.3154296875, 368.853515625, 18.269708633423, -2676.369140625, 390.162109375, -17.432621002197, 0, 70)
		setElementInterior(getLocalPlayer(),0)
		setElementDimension(getLocalPlayer(),0)
		outputChatBox("Estás vigilando la cámara de seguridad del Ayuntamiento",0,255,0)
	end
	if (source == button_cam_close) then
        fadeCamera (true)
		setCameraTarget (getLocalPlayer())
	    showCursor(false)
		guiSetVisible(cams_wnd,false)
		setCameraGoggleEffect("normal")
		setElementInterior(getLocalPlayer(),6)
		setElementDimension(getLocalPlayer(),3)
		setElementFrozen(getLocalPlayer(),false)
		setElementPosition(getLocalPlayer(),231.212890625, 76.412109375, 1005.0390625)
	    outputChatBox("Has Apagado el ordenador de las cámaras",0,255,0)
	    setElementData(getLocalPlayer(),"concamaraspd",false)
	end
end)