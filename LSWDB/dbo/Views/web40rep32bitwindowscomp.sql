﻿
CREATE VIEW [dbo].[web40rep32bitwindowscomp]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblAssets.Description, 
                        dbo.tblComputersystem.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblComputersystem ON dbo.tblAssets.AssetID = dbo.tblComputersystem.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblComputersystem.SystemType LIKE 'x86%') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName