
CREATE VIEW [dbo].[web40repIEBar]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblIEBars.Control, dbo.tblIEBars.Lastchanged, 
                        dbo.tsysOS.Image AS icon
FROM          dbo.tblIEBars INNER JOIN
                        dbo.tblAssets ON dbo.tblIEBars.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (NOT (dbo.tblIEBars.Control IN
                            (SELECT      tblsafeguids.guid
                              FROM           tblsafeguids))) AND (NOT (dbo.tblIEBars.Control LIKE '{CAFEEFAC-00%')) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName, dbo.tblIEBars.Lastchanged