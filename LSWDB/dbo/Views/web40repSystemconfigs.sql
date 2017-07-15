
CREATE VIEW [dbo].[web40repSystemconfigs]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tsysOS.Image AS icon, dbo.tblAssets.Domain, dbo.tsysOS.OSname, 
                        dbo.tblAssets.Description, dbo.tblAssets.Username, dbo.tblAssets.Userdomain, dbo.tblAssets.Memory, 
                        CAST(CAST(CAST(dbo.tblDiskdrives.Size AS bigint) / 1024 / 1024 / 1024 AS numeric) AS nvarchar) AS [Disk size], 
                        dbo.tblAssets.NrProcessors AS [#CPU], dbo.tblAssets.Processor, dbo.tblAssetCustom.Model, dbo.tblAssetCustom.Manufacturer, 
                        dbo.tblAssetCustom.Serialnumber AS Serial, dbo.tblAssets.IPAddress AS [IP Address], dbo.tblAssetCustom.PurchaseDate, 
                        dbo.tblAssetCustom.Warrantydate
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblDiskdrives ON dbo.tblAssets.AssetID = dbo.tblDiskdrives.AssetID LEFT OUTER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblDiskdrives.Caption = 'c:') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetID