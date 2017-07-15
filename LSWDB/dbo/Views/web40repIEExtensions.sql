
CREATE VIEW [dbo].[web40repIEExtensions]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblIEExtensions.Control, dbo.tblIEExtensions.Buttontext, 
                        dbo.tblIEExtensions.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblIEExtensions INNER JOIN
                        dbo.tblAssets ON dbo.tblIEExtensions.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (NOT (dbo.tblIEExtensions.Control IN
                            (SELECT      tblsafeguids.guid
                              FROM           tblsafeguids))) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName