
CREATE VIEW [dbo].[web40repmemorytype]
AS
SELECT DISTINCT 
                        TOP 1000000 dbo.tsysOS.Image AS icon, dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, 
                        dbo.tblAssets.Memory, dbo.TsysMemorytypes.MemoryName
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblPhysicalMemory ON dbo.tblAssets.AssetID = dbo.tblPhysicalMemory.AssetID INNER JOIN
                        dbo.TsysMemorytypes ON dbo.tblPhysicalMemory.MemoryType = dbo.TsysMemorytypes.Memorytype INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)