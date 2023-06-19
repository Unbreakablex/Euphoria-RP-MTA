local radio = { }

radio.playRadio = function ( player )
	if isElement( player ) then
		local veh = player:getOccupiedVehicle( )
		if isElement( veh ) then
			triggerClientEvent( root, "onClientPlayVehicleRadio", player, veh, 1 )
		elseif player:getInterior( ) > 0 then	
			triggerClientEvent( root, "onClientPlayIntRadio", player, player, 1 )			
		else
			player:outputChat( "No estas ni en un vehiculo ni en un interior", 255, 0, 0, true )
		end
	end
end

radio.changeStation = function( player, cmd, class )
	if isElement( player ) and class then
		local veh = player:getOccupiedVehicle( )		
		if isElement( veh ) then
			local vehRadio = veh:getData( "currentRadio" )
			if class == "-" then		
				if vehRadio == 1 then
					vehRadio = 24
				else
					vehRadio = vehRadio - 1
				end
			end
			if class == "+" then		
				if vehRadio == 24 then
					vehRadio = 1
				else
					vehRadio = vehRadio + 1
				end
			end
			triggerClientEvent( root, "onClientChangeVehicleRadio", player, veh, vehRadio )			
		elseif player:getInterior( ) > 0 then	
			local intRadio = player:getData( "currentRadio" )
			if class == "-" then		
				if intRadio == 1 then
					intRadio = 24
				else
					intRadio = intRadio - 1
				end
			end
			if class == "+" then		
				if intRadio == 24 then
					intRadio = 1
				else
					intRadio = intRadio + 1
				end
			end
			triggerClientEvent( root, "onClientPlayIntRadio", player, player, intRadio )			
		else
			player:outputChat( "No estas ni en un vehiculo ni en un interior", 255, 0, 0, true )
		end
	end
end

radio.changeVolume = function( player, cmd, volume )
	if isElement( player ) and volume then
		local veh = player:getOccupiedVehicle( )
		if isElement( veh ) then
			triggerClientEvent( root, "onClientChangeVolumeVehicleRadio", player, veh, volume )			
		elseif player:getInterior( ) > 0 then	
			triggerClientEvent( root, "onClientChangeVolumeIntRadio", player, player, volume )			
		else
			player:outputChat( "No estas ni en un vehiculo ni en un interior", 255, 0, 0, true )
		end
	else
		player:outputChat( "Syntaxis: /" .. cmd .. " [ volumen ( + ) ( - ) ]")
	end
end

radio.playCustom = function( player, cmd, link )
	if isElement( player ) and link then
		local veh = player:getOccupiedVehicle( )
		if isElement( veh ) then
			triggerClientEvent( root, "onClientPlayCustomVehicleRadio", player, veh, link )			
		elseif player:getInterior( ) > 0 then	
			triggerClientEvent( root, "onClientPlayCustomIntRadio", player, player, link )
			-- print( link )			
		else
			player:outputChat( "No estas ni en un vehiculo ni en un interior", 255, 0, 0, true )
		end
	else
		player:outputChat( "Syntaxis: /" .. cmd .. " [ LINK ]")
	end
end

addCommandHandler( "radio", radio.playRadio )
addCommandHandler( "radiov", radio.changeVolume )
addCommandHandler( "cradio", radio.changeStation )
addCommandHandler( "radioc", radio.playCustom )