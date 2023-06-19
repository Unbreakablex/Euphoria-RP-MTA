function replaceTexture ()
txd1 = engineLoadTXD("lanbloki.txd") 
engineImportTXD(txd1, 4027)
end
addEventHandler( "onClientResourceStart", resourceRoot, replaceTexture )