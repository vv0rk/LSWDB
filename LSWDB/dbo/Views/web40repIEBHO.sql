
CREATE VIEW [dbo].[web40repIEBHO]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblIEBHO.Control, dbo.tblIEBHO.Lastchanged, 
                        dbo.tsysOS.Image AS icon
FROM          dbo.tblIEBHO INNER JOIN
                        dbo.tblAssets ON dbo.tblIEBHO.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (NOT (dbo.tblIEBHO.Control IN
                            (SELECT      tblsafeguids.guid
                              FROM           tblsafeguids))) AND (NOT (dbo.tblIEBHO.Control LIKE '{CAFEEFAC-00%')) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName, dbo.tblIEBHO.Lastchanged