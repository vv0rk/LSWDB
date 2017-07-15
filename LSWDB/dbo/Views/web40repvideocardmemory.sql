﻿CREATE VIEW dbo.web40repvideocardmemory AS Select Top 1000000 tblAssets.AssetID, tblAssets.AssetUnique, tblAssets.Domain, tsysOS.OSname, tblVideoController.Caption, Ceiling(tblVideoController.AdapterRAM / 1024 / 1024) As [Ram MB], tblVideoController.Lastchanged, tsysOS.Image As icon, tblAssetCustom.Custom1, tblAssetCustom.Custom2, tblAssetCustom.Custom3, tblAssetCustom.Custom4, tblAssetCustom.Custom7, tblAssetCustom.Custom19, tblAssetCustom.Custom5, tblAssetCustom.Custom6, tblAssetCustom.Custom8, tblAssetCustom.Custom11, tblVideoController.VideoModeDescription, tblVideoController.VideoMemoryType, tblVideoController.VideoArchitecture, tblVideoController.DeviceID From tblVideoController Inner Join tblAssets On tblVideoController.AssetID = tblAssets.AssetID Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode Where tblAssetCustom.State = 1 And Coalesce(tblVideoController.AdapterRAM, 0) <> 0 Order By [Ram MB] Desc, tblAssets.AssetName