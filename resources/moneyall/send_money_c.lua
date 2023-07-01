--[[
Name: 
	admin-send-money-hl
Description: 
	Script to send money to all players
Created by: 
	lLinux (HackerlLinux)
Contact:
	Skype: HackerlLinux
	FB: www.fb.com/lLinux
]]--

function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    guiSetPosition(center_window, x, y, false)
end

        GUI = guiCreateWindow(530, 297, 281, 85, "Send money to all players", false)
        guiWindowSetSizable(GUI, false)
		guiSetVisible(GUI, false)
		centerWindow (GUI)
		
        Label = guiCreateLabel(10, 33, 58, 15, "Cantidad $::", false, GUI)
        Money_Edit = guiCreateEdit(78, 31, 82, 21, "", false, GUI)
        guiEditSetMaxLength(Money_Edit, 8)
        Boton_Send = guiCreateButton(170, 31, 47, 21, "Enviar", false, GUI)
        guiSetProperty(Boton_Send, "NormalTextColour", "FFAAAAAA")
        CopyRight = guiCreateLabel(10, 60, 261, 15, "No dar mas de $5000 al dia.", false, GUI)
        guiSetFont(CopyRight, "default-bold-small")
        guiLabelSetColor(CopyRight, 255, 255, 255)
        guiLabelSetHorizontalAlign(CopyRight, "center", false)
        Boton_Cancelar = guiCreateButton(223, 31, 47, 21, "Cancel", false, GUI)
        guiSetProperty(Boton_Cancelar, "NormalTextColour", "FFAAAAAA")    
		


function Open ()
	guiSetVisible(GUI, true)
	showCursor(true)
end
addEvent("Abrir", true)
addEventHandler("Abrir", getLocalPlayer(), Open)

function close ()
	guiSetVisible(GUI, false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", Boton_Cancelar, close, false)

function sendm ()
	name = getPlayerName(getLocalPlayer())
	cantidad = guiGetText(Money_Edit)
	triggerServerEvent("SendMoney1",getRootElement(),cantidad,name)
end
addEventHandler("onClientGUIClick", Boton_Send, sendm, false)
