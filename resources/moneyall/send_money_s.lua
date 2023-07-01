function onAdmins ( thePlayer )
local cuenta = getAccountName( getPlayerAccount(thePlayer) )
	if isObjectInACLGroup("user."..cuenta, aclGetGroup("Desarrollador")) then
		triggerClientEvent ( "Abrir", thePlayer)
	else
		outputChatBox("ACCESO DENEGADO!", thePlayer, 255, 0, 0, true)
	end
end
addCommandHandler("sendmoney", onAdmins)

function Enviar (cantidad, name)
	givePlayerMoney(getRootElement(), tonumber(cantidad))
	outputChatBox("#F4D300"..name.."#F4D300 ha regalado a los jugadores #F4D300$"..cantidad, getRootElement(), 255, 255, 255, true)
end
addEvent("SendMoney1", true)
addEventHandler("SendMoney1", getRootElement(), Enviar)
