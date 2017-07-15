﻿CREATE VIEW dbo.web50rep4860b2d81e3e4be2b72b98486656329e AS Select Top 1000000 ai.id, n.code As N'Код номенклатуры', ai.inventoryNumber As N'Инвентарный №', ai.serialNumber As N'Серийный №', ak.name As N'Наименование устройства', ak.organization As N'Организация владелец', ak.mol As N'МОЛ', ac.AssetID, a.AssetName From rAssetsImported As ai Inner Join rAssetsKsu As ak On ai.assetKsuId = ak.id Left Join rNomenclature As n On ak.nomenclatureId = n.id Left Join tblAssetCustom As ac On ai.assetId = ac.AssetID Left Join tblAssets As a On ac.AssetID = a.AssetID Where Not ak.organization Like N'Волгаэнергосбыт ЗАО' And Not ak.organization Like N'Автозаводская ТЭЦ' And Not ak.organization Like N'Крамз-Авто, ООО' And Not ak.organization Like N'Заводские сети, ООО' And Not ak.organization Like N'Московский филиал ЕСЭ-распределительная генерация' And Not ak.mol Like N'Калинкин Сергей %' And ac.AssetID Is Null