
CREATE VIEW [dbo].[web40repIEActiveX]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblIEActiveX.Control, dbo.tblIEActiveX.CodeBase, 
                        dbo.tblIEActiveX.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblIEActiveX INNER JOIN
                        dbo.tblAssets ON dbo.tblIEActiveX.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (NOT (dbo.tblIEActiveX.Control IN
                            (SELECT      tblsafeguids.guid
                              FROM           tblsafeguids))) AND (NOT (dbo.tblIEActiveX.Control LIKE '{CAFEEFAC-00%')) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName, dbo.tblIEActiveX.Lastchanged