precios =
{
	{ model = "Admiral", price = 40000},
	{ model = "Alpha", price = 77000},
	{ model = "Bandito", price = 35000},
	{ model = "Banshee", price = 118000},
	{ model = "BF-400", price = 10000},
	{ model = "BF Injection", price = 45000},
	{ model = "Bike", price = 1200},
	{ model = "Blade", price = 45000},
	{ model = "Blista Compact", price = 40000},
	{ model = "BMX", price = 1450},
	{ model = "Bobcat", price = 22000},
	{ model = "Bravura", price = 10000},
	{ model = "Broadway", price = 18000},
	{ model = "Buccaneer", price = 45000},
	{ model = "Buffalo", price = 88000},
	{ model = "Bullet", price = 100000},
	{ model = "Burrito", price = 30000},
	{ model = "Camper", price = 16000},
	{ model = "Cadrona", price = 25000},
	{ model = "Cheetah", price = 99000},
	{ model = "Clover", price = 21000},
	{ model = "Club", price = 26000},
	{ model = "Comet", price = 109000},
	{ model = "Dinghy", price = 15000},
	{ model = "Elegant", price = 48000},
	{ model = "Elegy", price = 75000},
	{ model = "Emperor", price = 48000},
	{ model = "Esperanto", price = 39000},
	{ model = "Euros", price = 83000},
	{ model = "FCR-900", price = 16000},
	{ model = "Faggio", price = 2500},
	{ model = "Feltzer", price = 49000},
	{ model = "Flash", price = 76000},
	{ model = "Fortune", price = 18000},
	{ model = "Freeway", price = 12000},
	{ model = "Glendale", price = 8000},
	{ model = "Greenwood", price = 35000},
	{ model = "Hermes", price = 16000},
	{ model = "Huntley", price = 40000},
	{ model = "Hustler", price = 60000},
	{ model = "Intruder", price = 31000},
	{ model = "Jester", price = 73000},
	{ model = "Journey", price = 25000},
	{ model = "Landstalker", price = 25000},
	{ model = "Majestic", price = 38000},
	{ model = "Manana", price = 5500},
	{ model = "Maverick", price = 800000},
	{ model = "Merit", price = 35000},
	{ model = "Mesa", price = 35000},
	{ model = "Moonbeam", price = 15000},
	{ model = "Mountain Bike", p = 1800},
	{ model = "Nebula", price = 38000},
	{ model = "NRG-500", price = 80000},
	{ model = "Oceanic", price = 36000},
	{ model = "PCJ-600", price = 12000},
	{ model = "Perennial", price = 30000},
	{ model = "Phoenix", price = 72000},
	{ model = "Picador", price = 18000},
	{ model = "Pony", price = 15000},
	{ model = "Premier", price = 42000},
	{ model = "Primo", price = 4000},
	{ model = "Quadbike", price = 20000},
	{ model = "Rancher", price = 30000},
	{ model = "Regina", price = 27000},
	{ model = "Remington", price = 32000},
	{ model = "Rumpo", price = 22000},
	{ model = "Sandking", price = 75000},
	{ model = "Sabre", price = 72000},
	{ model = "Sadler", price = 5500},
	{ model = "Sanchez", price = 40000},
	{ model = "Savanna", price = 35000},
	{ model = "Sentinel", price = 43500},
	{ model = "Slamvan", price = 30000},
	{ model = "Solair", price = 40000},
	{ model = "Sparrow", price = 600000},
	{ model = "Stafford", price = 44000},
	{ model = "Stallion", price = 32000},
	{ model = "Stratum", price = 50000},
	{ model = "Squalo", price = 380000},
	{ model = "Sultan", price = 87000},
	{ model = "Super GT", price = 95000},
	{ model = "Sunrise", price = 56000},
	{ model = "Tahoma", price = 32000},
	{ model = "Tampa", price = 6000},
	{ model = "Tornado", price = 45000},
	{ model = "Tropic", price = 480000},
	{ model = "Turismo", price = 140000},
	{ model = "Infernus", price = 200000},
	{ model = "Uranus", price = 70000},
	{ model = "Vincent", price = 39000},
	{ model = "Voodoo", price = 45000},
	{ model = "Washington", price = 40000},
	{ model = "Wayfarer", price = 13000},
	{ model = "Windsor", price = 64000},
	{ model = "Willard", price = 32000},
	{ model = "Yosemite", price = 30000},
	{ model = "ZR-350", price = 90000},
}

zonadesguace = createColSphere (210.2939453125, -258.51953125, 1.5204842090607, 20 )
local marker = createMarker (210.2939453125, -258.51953125, 0.5204842090607, "cylinder", 2.9, 255, 50, 35, 0);

personajedesguace = createPed ( 16, 212.9541015625, -261.607421875, 1.5104095935822, 42.256805419922, false )
setElementData( personajedesguace, "npcname", "Arturo el Desguazador" )
setElementInterior( personajedesguace,0)
setElementDimension( personajedesguace, 0)
setTimer(setElementFrozen, 2000, 1, personajedesguace, true)

function desguazar (player)
    if isElementWithinColShape ( player, zonadesguace ) then
	    if isPedInVehicle(player) then
			local vehicle = getPedOccupiedVehicle (player)
		    if vehicle then
				local model = getElementModel(vehicle)
				local namecar = getVehicleNameFromModel (model)
				local charid = exports.players:getCharacterID(player)
				local carowner = exports.vehicles:getOwner(vehicle)
				local id = exports.vehicles:getIDFromVehicle(vehicle)
			    if charid == carowner then
			        for k, v in ipairs( precios ) do
			            if v.model == namecar then
						    if exports.sql:query_free( "DELETE FROM vehicles WHERE vehicleID = " .. id ) then
								exports.players:giveMoney( player, math.floor(v.price*0.65) )
								destroyElement(vehicle)
								outputChatBox("[Inglés] Arturo el Desguazador dice: Me encanta hacer negocios con personas como tú, toma tus "..math.floor(v.price*0.65).." dólares.", player, 255, 255, 255)
								outputChatBox("Has vendido el auto por el 65% del valor de mercado.", player, 255, 255,0)
								outputChatBox("Has recibido "..math.floor(v.price*0.65).."$ por el vehículo con ID("..id..")", player, 0, 255,0)
						    else
							end
			            end
					end
				else
					outputChatBox("[Inglés] Arturo el Desguazador dice: No sé a qué te dedicas ni me interesa pero saca ese auto posiblemente robado de mi propiedad.", player, 255, 255, 255)
					outputChatBox("(( Este no es tu vehículo. ))", player, 255, 0, 0)
				end
			end
	    else
	    	outputChatBox("[Inglés] Arturo el Desguazador dice: ¿Quieres desguazarte a tu mismo o qué?", player, 255, 255, 255)
			outputChatBox("(( Debes estar en un vehiculo, genio ))", player, 255, 0, 0)
		end
	else
		outputChatBox("(( Debes estar en el desguezadero para desguazar un auto ))", player, 255, 0, 0)
	end
end
addCommandHandler("desguazar", desguazar)