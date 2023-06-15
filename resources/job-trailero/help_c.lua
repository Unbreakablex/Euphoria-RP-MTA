local blip, sphere

addEvent( getResourceName( resource ) .. ":introduce", true )
addEventHandler( getResourceName( resource ) .. ":introduce", root,
	function( )
		exports.gui:hint( "Tu trabajo: Trailero", "Es fácil, sigue la ruta y párate en los puntos verdes.", 1 )
		
		if not blip and not sphere then
			sphere = createColSphere( -2064.2470703125, -2448.9345703125, 30.625, 50 )
			blip = createBlipAttachedTo( sphere, 0, 3, 0, 255, 0, 127 )
			
			addEventHandler( "onClientColShapeHit", sphere,
				function( element )
					if element == getLocalPlayer( ) then
						destroyElement( blip )
						destroyElement( sphere )
						
						sphere = nil
						blip = nil
						
						exports.gui:hint( "Tu trabajo: Trailero", "Sube a un trailer y ve por la mercancia." )
					end
				end
			)
		end
	end
)