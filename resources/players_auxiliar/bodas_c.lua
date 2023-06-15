-- Client Sistema de matrimonio DTRP - FrankGT

addEventHandler( 'onClientResourceStart', resourceRoot,
function( )
	-------- Iglesia DTRP
	local iglesiaboda = playSound3D( "https://audio.jukehost.co.uk/6Jsa36U1BVpSufe9NbIcKmkYMCuvsz7d.mp3", 381.4716796875, 2323.720703125, 1889.5668945312, true )
	setElementDimension( iglesiaboda, 5 )
	setElementInterior(iglesiaboda,3)
	setSoundVolume( iglesiaboda, 2 )
	setSoundMaxDistance(iglesiaboda, 3000 )
	
	local iglesiaboda = playSound3D( "https://audio.jukehost.co.uk/zLIiLi6XoCzDboPkz2fZLiVdghuPzvSG.mp3", 2638.927734375, -23.5126953125, 82.537460327148, true )
	setElementDimension( iglesiaboda, 0 )
	setElementInterior(iglesiaboda,0)
	setSoundVolume( iglesiaboda, 2.5 )
	setSoundMaxDistance(iglesiaboda, 2 )
end
)