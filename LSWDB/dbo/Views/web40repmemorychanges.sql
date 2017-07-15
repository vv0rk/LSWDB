
CREATE VIEW [dbo].[web40repmemorychanges]
AS
SELECT DISTINCT 
                        TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, 
                        CASE tblPhysicalMemoryhist.Action WHEN 1 THEN 'Added' WHEN 2 THEN 'Removed' END AS Action, dbo.tblPhysicalMemoryHist.DeviceLocator, 
                        CEILING(dbo.tblPhysicalMemoryHist.Capacity / 1024 / 1024) AS MB, dbo.TsysMemorytypes.MemoryName, 
                        dbo.tblPhysicalMemoryHist.Lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblPhysicalMemoryHist ON dbo.tblAssets.AssetID = dbo.tblPhysicalMemoryHist.AssetID INNER JOIN
                        dbo.TsysMemorytypes ON dbo.tblPhysicalMemoryHist.MemoryType = dbo.TsysMemorytypes.Memorytype INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblPhysicalMemoryHist.Lastchanged DESC, dbo.tblAssets.AssetID, dbo.tblPhysicalMemoryHist.DeviceLocator