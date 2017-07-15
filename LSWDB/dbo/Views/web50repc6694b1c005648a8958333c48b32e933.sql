﻿CREATE VIEW dbo.web50repc6694b1c005648a8958333c48b32e933 AS Select Top 1000001 tblAssets.AssetID As ID, tblAssetCustom.Custom6 As Владелец, tblAssetCustom.Custom1 As Организация, tblAssetCustom.Custom2 As Город, tblAssetCustom.Custom3 As Адрес, tblAssetCustom.Custom4 As Кабинет, tblAssetCustom.Custom5 As Место, tblAssetCustom.Custom7 As [Инвент №], tblAssets.AssetName As [Имя ПК], tblAssetCustom.Custom11 As [ФИО пользователя], tblAssets.Processor As CPU, tblAssets.Memory As [Память ГБ], Sum(Cast(tblDiskdrives.Size / Power(2, 30) As numeric(36,2))) As [Объем диска ГБ], Sum(Cast(tblDiskdrives.Freespace / Power(2, 30) As numeric(36,2))) As [Свободно ГБ], tsysAssetTypes.AssetTypename, tblAssets.IPAddress, tblAssets.NrProcessors, tblBaseBoard.Manufacturer, tblBaseBoard.Product, tblBaseBoard.Version, rCompany$.Parent, adu.name, tblState.Statename As Состояние, tblAssets.Mac, OS.Caption, tblAssetCustom.Custom19 As [ФИО Отв ВТшник], rCompany$.numPC As [Кол-во ПК], o.title As Отдел, e.post As Должность, tblAssetCustom.Serialnumber As N'Серийный №', tblAssetCustom.SystemSKU From tblAssets Left Join tsysIPLocations On tsysIPLocations.StartIP <= tblAssets.IPNumeric And tsysIPLocations.EndIP >= tblAssets.IPNumeric Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID Left Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype Left Join tblOperatingsystem As OS On OS.AssetID = tblAssets.AssetID Left Join tblAssetGroupLink On tblAssets.AssetID = tblAssetGroupLink.AssetID Left Join tblDiskdrives On tblAssets.AssetID = tblDiskdrives.AssetID Left Join tblBaseBoard On tblAssets.AssetID = tblBaseBoard.AssetID Left Join rCompany$ On tblAssetCustom.Custom1 = rCompany$.Code Left Join rEmployee As e On tblAssetCustom.Custom11 = e.title And rCompany$.IdOU = e.organization Left Join rOU As o On e.parent_id = o.id Left Join (Select adu.Username As username, adu.Name As name From tblADusers As adu Inner Join (Select Distinct adu.Username As username, Max(adu.ADUserID) As id From tblADusers As adu Group By adu.Username) As addu On adu.ADUserID = addu.id) As adu On tblAssets.Username = adu.username Inner Join tblState On tblState.State = tblAssetCustom.State Where (tsysAssetTypes.AssetTypename = 'Windows') Or (tsysAssetTypes.AssetTypename = 'Vmware server') Group By tblAssets.AssetID, tblAssetCustom.Custom6, tblAssetCustom.Custom1, tblAssetCustom.Custom2, tblAssetCustom.Custom3, tblAssetCustom.Custom4, tblAssetCustom.Custom5, tblAssetCustom.Custom7, tblAssets.AssetName, tblAssetCustom.Custom11, tblAssets.Processor, tblAssets.Memory, tsysAssetTypes.AssetTypename, tblAssets.IPAddress, tblAssets.NrProcessors, tblBaseBoard.Manufacturer, tblBaseBoard.Product, tblBaseBoard.Version, rCompany$.Parent, adu.name, tblState.Statename, tblAssets.Mac, OS.Caption, tblAssetCustom.Custom19, rCompany$.numPC, o.title, e.post, tblAssetCustom.Serialnumber, tblAssetCustom.SystemSKU Order By Организация, Город, Адрес, Кабинет, Место