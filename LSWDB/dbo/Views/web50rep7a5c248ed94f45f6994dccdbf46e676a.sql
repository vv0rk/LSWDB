﻿CREATE VIEW dbo.web50rep7a5c248ed94f45f6994dccdbf46e676a AS Select Top 1000000 a.AssetID As 'Asset Id', a.AssetID, a.AssetName, ac.Custom1 As N'Организация', ac.Custom2 As N'Город', ac.Custom3 As N'Адрес', ac.Custom4 As N'Офис', ac.Custom19 As N'Ответственный ВТшник', md.Model As N'Название модели', s.Company As N'Склад компании', s.ScladName As N'Имя склада', s.Address As N'Адрес склада', ma.PartNumber, ma.Name As N'Название', ma.Resource As N'Заявленный ресурс', mr.Date As N'Дата установки', mr.Number As N'Число установленных материалов', mr.ResourceFact As N'Фактическое число отпечатков', mr.PrintedPages As [N'Число отпечатков'] From rMaterialRashod As mr Inner Join tblAssets As a On mr.AssetId = a.AssetID Inner Join tblAssetCustom As ac On mr.AssetId = ac.AssetID Inner Join rMaterialAnalog As ma On mr.IdMaterialAnalog = ma.Id Inner Join rSclad As s On mr.IdSclad = s.Id Left Join rModelLink As ml On ac.Model = ml.ModelAsset Left Join rModelDevice As md On ml.ModelSprav = md.Model Order By N'Организация', N'Город', ac.AssetID, N'Дата установки'