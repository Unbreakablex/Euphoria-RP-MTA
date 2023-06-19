function replaceTexture ()
txd = engineLoadTXD("stuff2_sfn.txd") 
engineImportTXD(txd, 9339)
end
addEventHandler( "onClientResourceStart", resourceRoot, replaceTexture )