local screen = {guiGetScreenSize()}
local teleport_position =
    {        
	 {"RCSD", 2413.365234375, 49.650390625, 26.484375},
	 {"SCRC", 1224.2978515625, 251.0732421875, 19.55354309082},
	 {"Ayuntamiento", 2267.36328125, -88.8564453125, 26.484375},
	 {"RCFD", 1246.3486328125, 336.01953125, 19.5546875},
	 {"RCFM", 2438.18, -54.91, 26.01},
	 {"PCMW", 2292.0888671875, -109.4990234375, 26.453544616699},
	 {"Autoescuela", 2333.15625, 191.447265625, 26.453544616699},
	 {"Banco RC", 2302.994140625, -15.8876953125, 26.484375},
	 {"Concesionario", 1771.974609375, 114.630859375, 34.75354385376},
	 {"Ammunation", 295.27, -37.72, 1000.52},
	 {"TTL", 1350.8583984375, 283.1630859375, 19.5546875}
	}
                     
window = guiCreateWindow((screen[1]/2)-(240/2), (screen[2]/2)-(320/2), 240, 320, "Lugares Actuales", false)
guiSetVisible(window, false)
teleport_button = guiCreateButton(0, 0.78, 1, 0.08, "Ir", true, window)
close_button = guiCreateButton(0, 0.88, 1, 0.08, "Cerrar", true, window)
gridlist = guiCreateGridList(0, 0.08, 1.5, 0.68, true, window)
guiGridListAddColumn(gridlist, "Lugares definidos", 0.85)
for key, teleports in pairs(teleport_position) do
local row = guiGridListAddRow(gridlist)
guiGridListSetItemText(gridlist, row, 1, teleports[1], false, false)
end

bindKey("F9", "down",
function ()
	if exports.players:isLoggedIn(getLocalPlayer()) and getElementData(getLocalPlayer(), "account:gmduty") == true then
		guiSetVisible(window, not guiGetVisible(window))
		showCursor(not isCursorShowing())
    end
end)

function reguladorTrans()
	if source == teleport_button then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		local check_gridlist = guiGridListGetItemText(gridlist, guiGridListGetSelectedItem(gridlist), 1)
		for key, teleports in pairs(teleport_position) do
		  if teleports[1] == check_gridlist then
		  outputChatBox("Te has teletransportado a " ..teleports[1]..".", 0, 255, 0)
		  fadeCamera(false, 1.0)
		  setTimer(fadeCamera, 1000, 1, true)
		  setTimer(setElementPosition, 1000, 1, getLocalPlayer(), teleports[2], teleports[3], teleports[4])
			if vehicle then
			setTimer(setElementPosition, 1000, 1, vehicle, teleports[2], teleports[3], teleports[4])
				end
			end
		end
	elseif source == close_button then
		guiSetVisible(window, false)
		showCursor(false)
	end
end
addEventHandler("onClientGUIClick", teleport_button, reguladorTrans)
addEventHandler("onClientGUIClick", close_button, reguladorTrans)