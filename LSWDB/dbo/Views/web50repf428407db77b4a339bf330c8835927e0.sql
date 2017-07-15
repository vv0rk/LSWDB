﻿CREATE VIEW dbo.web50repf428407db77b4a339bf330c8835927e0 AS Select Top 1000000 p.Company, p.Departament, p.Upravlenie, p.Otdel, p.Grupa, p.Dolgnost, p.FIO, at.AssetTypename, a.AssetName, a.Processor, a.Memory From rPersonal As p Left Join tblAssetCustom As ac On p.FIO = ac.Custom11 Left Join tblAssets As a On ac.AssetID = a.AssetID Left Join tsysAssetTypes As at On a.Assettype = at.AssetType Where p.FIO Not Like N'%вакан%' Order By p.Company, p.Departament, p.Upravlenie, p.Otdel, p.Grupa, p.FIO, at.AssetTypename Desc