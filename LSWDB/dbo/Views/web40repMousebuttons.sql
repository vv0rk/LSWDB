
CREATE VIEW [dbo].[web40repMousebuttons]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblPointingDevice.Caption AS Mouse, CAST(dbo.tblPointingDevice.NumberOfButtons AS numeric) AS Buttons, dbo.tblPointingDevice.Lastchanged, 
                        dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblPointingDevice ON dbo.tblAssets.AssetID = dbo.tblPointingDevice.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (CAST(dbo.tblPointingDevice.NumberOfButtons AS numeric) < 3) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName