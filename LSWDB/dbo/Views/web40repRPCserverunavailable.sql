
CREATE VIEW [dbo].[web40repRPCserverunavailable]
AS
SELECT      TOP 1000000 dbo.tblErrors.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysasseterrortypes.ErrorMsg, dbo.tblErrors.ErrorText, 
                        dbo.tblErrors.Lastchanged AS [Last changed]
FROM          dbo.tblErrors INNER JOIN
                        dbo.tblAssets ON dbo.tblErrors.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysasseterrortypes ON dbo.tblErrors.ErrorType = dbo.tsysasseterrortypes.Errortype LEFT OUTER JOIN
                        dbo.tblOperatingsystem ON dbo.tblAssets.AssetID = dbo.tblOperatingsystem.AssetID
WHERE      (dbo.tblOperatingsystem.AssetID IS NULL) AND (dbo.tblAssetCustom.State = 1) AND (dbo.tblErrors.ErrorType = 2)
ORDER BY dbo.tblErrors.Lastchanged DESC