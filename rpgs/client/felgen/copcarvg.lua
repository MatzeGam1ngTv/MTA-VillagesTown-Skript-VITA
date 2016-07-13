function replaceModel() 
  txd = engineLoadTXD("client/felgen/data/wheel_gn1.txd", 1074 )
  engineImportTXD(txd, 1074)
  dff = engineLoadDFF("client/felgen/data/wheel_gn1.dff", 1074)
  engineReplaceModel(dff, 1074)
  
   txd = engineLoadTXD("client/felgen/data/wheel_gn2.txd", 1075 )
  engineImportTXD(txd, 1075)
  dff = engineLoadDFF("client/felgen/data/wheel_gn2.dff", 1075)
  engineReplaceModel(dff, 1075)
  
   txd = engineLoadTXD("client/felgen/data/wheel_gn3.txd", 1076 )
  engineImportTXD(txd, 1076)
  dff = engineLoadDFF("client/felgen/data/wheel_gn3.dff", 1076)
  engineReplaceModel(dff, 1076)
  
   txd = engineLoadTXD("client/felgen/data/wheel_gn4.txd", 1077 )
  engineImportTXD(txd, 1077)
  dff = engineLoadDFF("client/felgen/data/wheel_gn4.dff", 1077)
  engineReplaceModel(dff, 1077)
  
   txd = engineLoadTXD("client/felgen/data/wheel_gn5.txd", 1078 )
  engineImportTXD(txd, 1078)
  dff = engineLoadDFF("client/felgen/data/wheel_gn5.dff", 1078)
  engineReplaceModel(dff, 1078)
  
   txd = engineLoadTXD("client/felgen/data/wheel_lr1.txd", 1079 )
  engineImportTXD(txd, 1079)
  dff = engineLoadDFF("client/felgen/data/wheel_lr1.dff", 1079)
  engineReplaceModel(dff, 1079)
  
   txd = engineLoadTXD("client/felgen/data/wheel_lr2.txd", 1080 )
  engineImportTXD(txd, 1080)
  dff = engineLoadDFF("client/felgen/data/wheel_lr2.dff", 1080)
  engineReplaceModel(dff, 1080)
  
   txd = engineLoadTXD("client/felgen/data/wheel_lr3.txd", 1081 )
  engineImportTXD(txd, 1081)
  dff = engineLoadDFF("client/felgen/data/wheel_lr3.dff", 1081)
  engineReplaceModel(dff, 1081)
  
   txd = engineLoadTXD("client/felgen/data/wheel_lr4.txd", 1082 )
  engineImportTXD(txd, 1082)
  dff = engineLoadDFF("client/felgen/data/wheel_lr4.dff", 1082)
  engineReplaceModel(dff, 1082)
  
   txd = engineLoadTXD("client/felgen/data/wheel_lr5.txd", 1083)
  engineImportTXD(txd, 1083)
  dff = engineLoadDFF("client/felgen/data/wheel_lr5.dff", 1083)
  engineReplaceModel(dff, 1083)
  
   txd = engineLoadTXD("client/felgen/data/wheel_sr1.txd", 1084 )
  engineImportTXD(txd, 1084)
  dff = engineLoadDFF("client/felgen/data/wheel_sr1.dff", 1084)
  engineReplaceModel(dff, 1084)
  
  txd = engineLoadTXD("client/felgen/data/wheel_sr2.txd", 1085 )
  engineImportTXD(txd, 1085)
  dff = engineLoadDFF("client/felgen/data/wheel_sr2.dff", 1085)
  engineReplaceModel(dff, 1085)
  
  txd = engineLoadTXD("client/felgen/data/wheel_sr3.txd", 1096 )
  engineImportTXD(txd, 1096)
  dff = engineLoadDFF("client/felgen/data/wheel_sr3.dff", 1096)
  engineReplaceModel(dff, 1096)
  
  txd = engineLoadTXD("client/felgen/data/wheel_sr4.txd", 1097 )
  engineImportTXD(txd, 1097)
  dff = engineLoadDFF("client/felgen/data/wheel_sr4.dff", 1097)
  engineReplaceModel(dff, 1097)
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)

addCommandHandler ( "reloadcar", replaceModel )