local screenH, screenW = guiGetScreenSize()
local x, y = (screenH/1366), (screenW/768)

function HUD ()
    if getElementData(localPlayer, "nohud") then return end
		local noreloadweapons = {}
			noreloadweapons[16] = true
			noreloadweapons[17] = true
			noreloadweapons[18] = true
			noreloadweapons[19] = true
			noreloadweapons[25] = true
			noreloadweapons[33] = true
			noreloadweapons[34] = true
			noreloadweapons[35] = true
			noreloadweapons[36] = true
			noreloadweapons[37] = true
			noreloadweapons[38] = true
			noreloadweapons[39] = true
			noreloadweapons[41] = true
			noreloadweapons[42] = true
			noreloadweapons[43] = true

		local meleespecialweapons = {}
			meleespecialweapons[0] = true
			meleespecialweapons[1] = true
			meleespecialweapons[2] = true
			meleespecialweapons[3] = true
			meleespecialweapons[4] = true
			meleespecialweapons[5] = true
			meleespecialweapons[6] = true
			meleespecialweapons[7] = true
			meleespecialweapons[8] = true
			meleespecialweapons[9] = true
			meleespecialweapons[10] = true
			meleespecialweapons[11] = true
			meleespecialweapons[12] = true
			meleespecialweapons[13] = true
			meleespecialweapons[14] = true
			meleespecialweapons[15] = true
			meleespecialweapons[40] = true
			meleespecialweapons[44] = true
			meleespecialweapons[45] = true
			meleespecialweapons[46] = true

			local showammo1 = getPedAmmoInClip (localPlayer,getPedWeaponSlot(localPlayer))
			local showammo2 = getPedTotalAmmo(localPlayer)-getPedAmmoInClip(localPlayer)
			local showammo3 = getPedTotalAmmo(getLocalPlayer())
			local clip = getPedAmmoInClip (getLocalPlayer())
			local weapon = getPedWeapon ( getLocalPlayer() )
			local hr,mins = getTime()
			local time = hr..":"..(((mins <10) and "0"..mins) or mins)
			local colete = getPedArmor ( getLocalPlayer() )
			local oxigenio= getPedOxygenLevel ( getLocalPlayer() )
			if oxigenio < 1000 or isElementInWater (getLocalPlayer()) then
				dxDrawRectangle(x*1186, y*101, x*117, y*12, tocolor(0, 0, 0, 255), false)
				dxDrawRectangle(x*1187, y*102, x*115, y*10, tocolor(24, 131, 252, 155), false)
				dxDrawRectangle(x*1187, y*102, x*115/1000*oxigenio, y*10, tocolor(24, 131, 252, 255), false)
				dxDrawRectangle(x*1186, y*116, x*117, y*12, tocolor(0, 0, 0, 255), false)
				dxDrawRectangle(x*1187, y*117, x*115, y*10, tocolor(255, 255, 255, 155), false)
				dxDrawRectangle(x*1187, y*117, x*115/100*colete, y*10, tocolor(255, 255, 255, 255), false)
			local vida = getElementHealth ( getLocalPlayer() )
			local stat = getPedStat ( getLocalPlayer(), 24 )
				dxDrawRectangle(x*1186, y*131, x*117, y*12, tocolor(0, 0, 0, 255), false)
				dxDrawRectangle(x*1187, y*132, x*115, y*10, tocolor(255, 0, 0, 155), false)
			if stat < 1000 then
				dxDrawRectangle(x*1187, y*132, x*115/100*vida, y*10, tocolor(255, 0, 0, 255), false)
			else
				dxDrawRectangle(x*1187, y*132, x*115/200*vida, y*10, tocolor(255, 0, 0, 255), false)
			end
				dxDrawBorderedText(time, x*1152, y*146, x*1337, y*170, tocolor(255, 255, 255, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
				dxDrawImage(x*1215, y*168, x*59, y*59, "img/".. tostring( weapon ) .. ".png", 0, 0, 0, tocolor(255, 255, 255, 175), false)
				dxDrawImage(x*1217, y*170, x*55, y*55, "img/".. tostring( weapon ) .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			if noreloadweapons [getPedWeapon(getLocalPlayer())] then
				dxDrawBorderedText(tostring (showammo3), x*1223, y*219, x*1268, y*235, tocolor(161, 201, 254, 254), x*0.70, "default-bold", "center", "center", false, false, false, false, false)
			elseif meleespecialweapons [getPedWeapon(getLocalPlayer())] then
			else
				dxDrawBorderedText(tostring (showammo1).." / "..tostring (showammo2), x*1223, y*219, x*1268, y*235, tocolor(161, 201, 254, 254), x*0.70, "default-bold", "center", "center", false, false, false, false, false)
			end
			else
			local weapon = getPedWeapon ( getLocalPlayer() )
			local hr,mins = getTime()
			local time = hr..":"..(((mins <10) and "0"..mins) or mins)
			local colete = getPedArmor ( getLocalPlayer() )
				dxDrawRectangle(x*1186, y*101, x*117, y*12, tocolor(0, 0, 0, 255), false)
				dxDrawRectangle(x*1187, y*102, x*115, y*10, tocolor(255, 255, 255, 155), false)
				dxDrawRectangle(x*1187, y*102, x*115/100*colete, y*10, tocolor(255, 255, 255, 255), false)
			local vida = getElementHealth ( getLocalPlayer() )
			local stat = getPedStat ( getLocalPlayer(), 24 )
				dxDrawRectangle(x*1186, y*116, x*117, y*12, tocolor(0, 0, 0, 255), false)
				dxDrawRectangle(x*1187, y*117, x*115, y*10, tocolor(255, 0, 0, 155), false)
			if stat < 1000 then
				dxDrawRectangle(x*1187, y*117, x*115/100*vida, y*10, tocolor(255, 0, 0, 255), false)
			else
				dxDrawRectangle(x*1187, y*117, x*115/200*vida, y*10, tocolor(255, 0, 0, 255), false)
			end
				dxDrawBorderedText(time, x*1152, y*131, x*1337, y*155, tocolor(255, 255, 255, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
				dxDrawImage(x*1215, y*153, x*59, y*59, "img/".. tostring( weapon ) .. ".png", 0, 0, 0, tocolor(255, 255, 255, 175), false)
				dxDrawImage(x*1217, y*155, x*55, y*55, "img/".. tostring( weapon ) .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
			if noreloadweapons [getPedWeapon(getLocalPlayer())] then
				dxDrawBorderedText(tostring (showammo3), x*1223, y*204, x*1268, y*220, tocolor(161, 201, 254, 254), x*0.70, "default-bold", "center", "center", false, false, false, false, false)
			elseif meleespecialweapons [getPedWeapon(getLocalPlayer())] then
			else
				dxDrawBorderedText(tostring (showammo1).." / "..tostring (showammo2), x*1223, y*204, x*1268, y*220, tocolor(161, 201, 254, 254), x*0.70, "default-bold", "center", "center", false, false, false, false, false)
			end
		end
			local dinheiro = ("%008d"):format(getPlayerMoney(getLocalPlayer()))
				dxDrawBorderedText("$"..dinheiro, x*1152, y*65, x*1337, y*100, tocolor(60, 110, 50, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
		
		--dxDrawBorderedText("$00000000", x*1152, y*65, x*1337, y*100, tocolor(60, 160, 50, 255), x*1.00, "pricedown", "center", "center", false, false, false, false, false)
		end
addEventHandler("onClientRender", getRootElement(), HUD)

function OnStop ()
	setPlayerHudComponentVisible("armour", true)
	setPlayerHudComponentVisible("wanted", true)
	setPlayerHudComponentVisible("weapon", true)
	setPlayerHudComponentVisible("money", true)
	setPlayerHudComponentVisible("health", true)
	setPlayerHudComponentVisible("clock", true)
	setPlayerHudComponentVisible("breath", true)
	setPlayerHudComponentVisible("ammo", true)
end
addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()), OnStop)

function OnStart ()
	setPlayerHudComponentVisible("armour", false)
	setPlayerHudComponentVisible("wanted", false)
	setPlayerHudComponentVisible("weapon", false)
	setPlayerHudComponentVisible("money", false)
	setPlayerHudComponentVisible("health", false)
	setPlayerHudComponentVisible("clock", false)
	setPlayerHudComponentVisible("breath", false)
	setPlayerHudComponentVisible("ammo", false)
end
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), OnStart )

local hudTable = 
{
"ammo",
"armour",
"clock",
"health",
"money",
"weapon",
"wanted",
"area_name",
"vehicle_name",
"breath",
"clock"
}

addEventHandler("onClientResourceStart", resourceRoot,
    function()
	for id, hudComponents in ipairs(hudTable) do
		setPlayerHudComponentVisible(hudComponents, false)
	end
    end
)

addEventHandler("onClientResourceStop", resourceRoot,
    function()
	for id, hudComponents in ipairs(hudTable) do
		setPlayerHudComponentVisible(hudComponents, true)
	end
    end
)

function dxDrawBorderedText( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
	dxDrawText ( text:gsub('#%x%x%x%x%x%x', ''), x - 1, y - 1, w - 1, h - 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text:gsub('#%x%x%x%x%x%x', ''), x + 1, y - 1, w + 1, h - 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text:gsub('#%x%x%x%x%x%x', ''), x - 1, y + 1, w - 1, h + 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text:gsub('#%x%x%x%x%x%x', ''), x + 1, y + 1, w + 1, h + 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text:gsub('#%x%x%x%x%x%x', ''), x - 1, y, w - 1, h, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text:gsub('#%x%x%x%x%x%x', ''), x + 1, y, w + 1, h, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text:gsub('#%x%x%x%x%x%x', ''), x, y - 1, w, h - 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text:gsub('#%x%x%x%x%x%x', ''), x, y + 1, w, h + 1, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, true )
end

function apagarScript()
	if fileExists("client_hud.lua") then
		fileDelete("client_hud.lua")
	end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), apagarScript)
addEventHandler("onClientPlayerQuit", getRootElement(), apagarScript)
addEventHandler("onClientPlayerJoin", getRootElement(), apagarScript)
