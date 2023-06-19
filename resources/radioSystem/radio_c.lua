local vRadio = {}
local stations = {
	{ link = "http://kissfm.kissfmradio.cires21.com/kissfm.mp3", name = "Kiss FM" },
	{ link = "http://playerservices.streamtheworld.com/api/livestream-redirect/M80RADIO_SC", name = "M80 Radio" },
	{ link = "http://playerservices.streamtheworld.com/api/livestream-redirect/CADENADIAL_SC", name = "Cadena Dial" },
	{ link = "http://playerservices.streamtheworld.com/api/livestream-redirect/LOS40_SC", name = "Los 40 principales" },
	{ link = "http://playerservices.streamtheworld.com/api/livestream-redirect/RADIOLE_SC", name = "Radio Olé" },
	{ link = "https://cadena100-cope-rrcast.flumotion.com/cope/cadena100-low.mp3", name = "Cadena 100" },
	{ link = "http://195.10.10.213/rtva/canalfiestaradio_master.mp3", name = "Canal fiesta radio" },
	{ link = "http://hitfm.kissfmradio.cires21.com/hitfm.mp3", name = "Hit FM" },
	{ link = "http://listen.radionomy.com/1-radio-dance.m3u", name = "Radio Dance" },
	{ link = "http://radiostream.flaixfm.cat:8000/", name = "Flaix FM" },
	{ link = "http://playerservices.streamtheworld.com/api/livestream-redirect/MAXIMAFM_SC", name = "Maxima FM" },
	{ link = "http://listen.radionomy.com/radioanimex-musicaanimeymuchomas-.m3u", name = "Radio Animex" },
	{ link = "http://listen.radionomy.com/hotmixradio-sunny-128.m3u", name = "HotmixRadio" },
	{ link = "http://212.129.60.86:9968/stream/1/", name = "Europa FM" },
	{ link = "http://listen.radionomy.com/quemando-antena.m3u", name = "QuemandoAntena" },
	{ link = "http://listen.radionomy.com/1000classicalhits.m3u", name = "ClassicHits" },
	{ link = "http://listen.radionomy.com/cheche-reggaeton-radio.m3u", name = "CheChe Radio" },
	{ link = "http://listen.radionomy.com/el-flow-reggaeton.m3u", name = "ElFlow Radio" },
	{ link = "http://listen.radionomy.com/HardbaseFM.m3u", name = "HardBass Radio" },
	{ link = "http://listen.radionomy.com/mix247edm.m3u", name = "Edm Radio" },
	{ link = "http://listen.radionomy.com/dancenow-.m3u", name = "DanceNow Radio" },
	{ link = "http://listen.radionomy.com/r1dubstep.m3u", name = "Dubstep Radio" },
	{ link = "http://listen.radionomy.com/ilovedance24-7morethan100000hitsarlearadio.m3u", name = "Dance90's Radio" },
	{ link = "http://listen.radionomy.com/90stechnogeneration2016.m3u", name = "90sTechno Radio" },
}

addEvent( "onClientPlayVehicleRadio", true )
addEvent( "onClientPlayIntRadio", true )
addEvent( "onClientChangeVehicleRadio", true )
addEvent( "onClientChangeVolumeVehicleRadio", true )
addEvent( "onClientPlayCustomVehicleRadio", true )
addEvent( "onClientChangeIntRadio", true )
addEvent( "onClientPlayCustomIntRadio", true )
addEvent( "onClientChangeVolumeIntRadio", true )

addEventHandler( "onClientPlayVehicleRadio", root,
	function ( vehicle, radioID )
		if isElement( vehicle ) and radioID and vehicle:getType( ) == "vehicle" then
			local radioLink = stations[ radioID ].link
			local radioName = stations[ radioID ].name
			local vPos = vehicle:getPosition( )			
			if radioLink and radioName then 
				if isElement( vRadio[ vehicle ] ) then
					vRadio[ vehicle ]:destroy( )
				end
				vRadio[ vehicle ] = Sound3D( radioLink, vPos.x, vPos.y, vPos.z );
				vRadio[ vehicle ]:attach( vehicle );
				vRadio[ vehicle ]:setMaxDistance( 15 );
				vRadio[ vehicle ]:setVolume( 0.3 );
				vehicle:setData( "currentRadio", radioID )
				exports.notifications:addBox( "info", "Ahora estás escuchando la radio: ".. radioName )
				-- outputChatBox( "Ahora estás escuchando la radio: ".. radioName, 255, 255, 255, true )
			end
		end
	end
)

addEventHandler( "onClientPlayIntRadio", root,
	function ( player, radioID )
		if isElement( player ) and radioID then
			local radioLink = stations[ radioID ].link
			local radioName = stations[ radioID ].name
			local vPos = player:getPosition( )			
			local dim = player:getDimension( )
			if radioLink and radioName then 
				if isElement( vRadio[ dim ] ) then
					vRadio[ dim ]:destroy( )
				end
				vRadio[ dim ] = Sound3D( radioLink, vPos.x, vPos.y, vPos.z );
				vRadio[ dim ]:setMaxDistance( 45 );
				vRadio[ dim ]:setInterior( player:getInterior( ) )
				vRadio[ dim ]:setDimension( player:getDimension( ) )
				vRadio[ dim ]:setVolume( 0.3 );
				player:setData( "currentRadio", radioID )
				exports.notifications:addBox( "info", "Ahora estás escuchando la radio: ".. radioName )
				-- outputChatBox( "Ahora estás escuchando la radio: ".. radioName, 255, 255, 255, true )
			end
		end
	end
)

addEventHandler( "onClientChangeVehicleRadio", root,
	function ( vehicle, radioID )
		if isElement( vehicle ) and radioID and vehicle:getType( ) == "vehicle" then
			local radioLink = stations[ radioID ].link
			local radioName = stations[ radioID ].name
			local vPos = vehicle:getPosition( )			
			if radioLink and radioName then 
				if isElement( vRadio[ vehicle ] ) then
					vRadio[ vehicle ]:destroy( )
				end
				vRadio[ vehicle ] = Sound3D( radioLink, vPos.x, vPos.y, vPos.z );
				vRadio[ vehicle ]:attach( vehicle );
				vRadio[ vehicle ]:setMaxDistance( 15 );
				vRadio[ vehicle ]:setVolume( 0.3 );
				vehicle:setData( "currentRadio", radioID )
				exports.notifications:addBox( "info", "Ahora estás escuchando la radio: ".. radioName )
				-- outputChatBox( "Ahora estás escuchando la radio: ".. radioName, 255, 255, 255, true )
			end
		end
	end
)

addEventHandler( "onClientChangeVolumeVehicleRadio", root,
	function ( vehicle, volume )
		if isElement( vehicle ) and volume and vehicle:getType( ) == "vehicle" then
			if isElement( vRadio[ vehicle ] ) then
				if volume == "+" then
					vRadio[ vehicle ]:setVolume( vRadio[ vehicle ]:getVolume( ) + 0.1 );				
				elseif volume == "-" then
					vRadio[ vehicle ]:setVolume( vRadio[ vehicle ]:getVolume( ) - 0.1 );									
				end
				if math.floor( vRadio[ vehicle ]:getVolume( ) * 100 ) > 100 then					
					exports.notifications:addBox( "error", "Ya no puedes subir más el volumen de la radio." )
					-- triggerEvent( "add:notification", localPlayer, "No puedes subir más el volumen", "warn", true )				
				elseif math.floor( vRadio[ vehicle ]:getVolume( ) * 100 ) < 0 then 
					exports.notifications:addBox( "error", "Ya no puedes bajar más el volumen de la radio." )
					-- triggerEvent( "add:notification", localPlayer, "Ya no puedes bajar más el volumen de la radio.", "warn", true )				
				else
					-- triggerEvent( "add:notification", localPlayer, "El volumen de la radio ahora es: " .. math.floor( vRadio[ vehicle ]:getVolume( ) * 100 ) .. " %", "info", true )				
					exports.notifications:addBox( "info", "El volumen de la radio ahora es: " .. math.floor( vRadio[ vehicle ]:getVolume( ) * 100 ) .. " %" )
					-- outputChatBox( "El volumen de la radio ahora es: " .. math.floor( vRadio[ dim ]:getVolume( ) * 100 ) .. " %", 255, 255, 255, true )					
				end
			end
		end
	end
)

addEventHandler( "onClientChangeVolumeIntRadio", root,
	function ( player, volume )
		if isElement( player ) and volume and player:getType( ) == "player" then
			local dim = player:getDimension( )										
			if isElement( vRadio[ dim ] ) then
				if volume == "+" then
					vRadio[ dim ]:setVolume( vRadio[ dim ]:getVolume( ) + 0.1 );				
				elseif volume == "-" then
					vRadio[ dim ]:setVolume( vRadio[ dim ]:getVolume( ) - 0.1 );									
				end
				if math.floor( vRadio[ dim ]:getVolume( ) * 100 ) > 100 then					
					if player == localPlayer then
						exports.notifications:addBox( "error", "Ya no puedes subir más el volumen de la radio." )
					end
					-- triggerEvent( "add:notification", localPlayer, "No puedes subir más el volumen", "warn", true )				
				elseif math.floor( vRadio[ dim ]:getVolume( ) * 100 ) < 0 then 
					if player == localPlayer then
						exports.notifications:addBox( "error", "Ya no puedes bajar más el volumen de la radio." )
					end
					-- triggerEvent( "add:notification", localPlayer, , "warn", true )				
				else
					-- triggerEvent( "add:notification", localPlayer, , "info", true )				
					if player == localPlayer then
						exports.notifications:addBox( "info", "El volumen de la radio ahora es: " .. math.floor( vRadio[ dim ]:getVolume( ) * 100 ) .. " %" )
					end
					-- outputChatBox( "El volumen de la radio ahora es: " .. math.floor( vRadio[ dim ]:getVolume( ) * 100 ) .. " %", 255, 255, 255, true )					
				end
			end
		end
	end
)

addEventHandler( "onClientPlayCustomVehicleRadio", root, 
	function ( vehicle, link )
		if isElement( vehicle ) and link and vehicle:getType( ) == "vehicle" then
			local radioLink = link
			local vPos = vehicle:getPosition( )			
			if radioLink then
				if isElement( vRadio[ vehicle ] ) then
					vRadio[ vehicle ]:destroy( )
				end
				vRadio[ vehicle ] = Sound3D( radioLink, vPos.x, vPos.y, vPos.z );
				vRadio[ vehicle ]:attach( vehicle );
				vRadio[ vehicle ]:setMaxDistance( 15 );
				vRadio[ vehicle ]:setVolume( 0.3 );				
				exports.notifications:addBox( "info", "Ahora estás escuchando musica de usuario" )
			end
		end
	end
)

addEventHandler( "onClientPlayCustomIntRadio", root, 
	function ( player, link )
		if isElement( player ) and link then
			local radioLink = link
			local vPos = player:getPosition( )			
			local dim = player:getDimension( )						
			if radioLink then 
				if isElement( vRadio[ dim ] ) then
					vRadio[ dim ]:destroy( )
				end
				vRadio[ dim ] = Sound3D( radioLink, vPos.x, vPos.y, vPos.z );
				vRadio[ dim ]:setMaxDistance( 45 );
				vRadio[ dim ]:setInterior( player:getInterior( ) )
				vRadio[ dim ]:setDimension( player:getDimension( ) )
				vRadio[ dim ]:setVolume( 0.3 );
				player:setData( "currentRadio", radioID )
				-- outputChatBox( "Ahora estás escuchando cancion del usuario", 255, 255, 255, true )
				-- triggerEvent( "add:notification", localPlayer, "Ahora estás escuchando musica de usuario", "info", true )				
				if player == localPlayer then
					exports.notifications:addBox( "info", "Ahora estás escuchando musica de usuario" )
				end
			end
		end
	end
)
