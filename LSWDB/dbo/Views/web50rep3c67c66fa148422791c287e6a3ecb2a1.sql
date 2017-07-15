﻿CREATE VIEW dbo.web50rep3c67c66fa148422791c287e6a3ecb2a1 AS Select Top 1000000 tblAssets.AssetID As Id, ac.Custom1 As Организация, t.AssetTypename, tblAssets.AssetName, ac.Custom19 As [Ответственный ВТшник], l.IPLocation From tblAssets Inner Join tblAssetCustom As ac On tblAssets.AssetID = ac.AssetID Inner Join tsysAssetTypes As t On t.AssetType = tblAssets.Assettype Left Join tsysIPLocations As l On l.StartIP <= tblAssets.IPNumeric And l.EndIP >= tblAssets.IPNumeric Where (ac.Custom1 = '' Or ac.Custom1 Is Null) And (t.AssetTypename = 'Windows' Or t.AssetTypename = 'Printer') Order By [Ответственный ВТшник] Desc, l.IPLocation, t.AssetTypename