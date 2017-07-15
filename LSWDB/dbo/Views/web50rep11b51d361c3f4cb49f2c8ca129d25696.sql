﻿CREATE VIEW dbo.web50rep11b51d361c3f4cb49f2c8ca129d25696 AS Select Top 1000000 tblAssets.AssetID As ID, tblState.Statename As Статус, tblAssetCustom.Custom1 As Компания, tblAssetCustom.Custom2 As Город, tblAssetCustom.Custom3 As Улица, tblAssetCustom.Building As Дом, tblAssetCustom.Custom4 As Помещение, tsysAssetTypes.AssetTypename As [Тип устройства], tblAssets.AssetName As [Имя устройства], tblAssetCustom.Manufacturer As Производитель, tblAssetCustom.Model As Модель, tblAssets.Description As Описание, tblAssetCustom.Serialnumber As [Серийный номер], tblAssetCustom.OrderNumber As [Приходный ордер], tblAssetCustom.Custom7 As [Инв. номер], tblAssetCustom.Custom8 As [Номенкл. номер] From tblAssets Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype Inner Join tblState On tblState.State = tblAssetCustom.State Order By Компания, Город, Улица, Дом, Помещение, [Приходный ордер]