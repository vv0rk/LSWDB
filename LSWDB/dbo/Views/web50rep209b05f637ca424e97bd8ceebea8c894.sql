﻿CREATE VIEW dbo.web50rep209b05f637ca424e97bd8ceebea8c894 AS Select Top 1000000 tblAssets.AssetID As Id, tblAssetCustom.Custom1 As Организация, tblAssetCustom.Custom2 As Город, tblAssetCustom.Custom3 As Адрес, tblAssets.AssetName As N'Имя ПК', tblAssetCustom.Custom7 As N'Инвент №', tblAssetCustom.Model As N'Модель системной платы', tblAssets.Processor As N'Модель CPU', tblAssets.Memory As N'Объем памяти МБ', cc.Category As N'Рекомендация', tblAssetCustom.Custom11 As N'ФИО пользователя', tblAssetCustom.Custom19 As N'ФИО ответ. инженера УСЦ' From tblAssets Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype Inner Join tblState On tblState.State = tblAssetCustom.State Left Join rCPUrek As cr On tblAssets.Processor = cr.CPU Left Join rCPUcat As cc On cr.idCategory = cc.Id Left Join rCompany$ As rc On dbo.tblAssetCustom.Custom1 = rc.Code Left Join tblOperatingsystem As os On dbo.tblAssetCustom.AssetID = os.AssetID Where tblState.Statename Like N'%active%' And Not os.Caption Like N'%server%' Order By Организация, Город, Адрес Desc