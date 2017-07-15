
CREATE VIEW [dbo].[web40repmemoryslots]
AS
SELECT      TOP 1000000 dbo.tsysOS.Image AS Icon, dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, 
                        CEILING(dbo.tblPhysicalMemoryArray.MaxCapacity / 1024) AS MaxCapacity, dbo.tblAssets.Memory, CAST(CorrectMemory.Used AS numeric) 
                        AS [Slots used], dbo.tblPhysicalMemoryArray.MemoryDevices AS [Slots available], 
                        dbo.tblPhysicalMemoryArray.MemoryDevices - CorrectMemory.Used AS [Slots free]
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblPhysicalMemoryArray ON dbo.tblAssets.AssetID = dbo.tblPhysicalMemoryArray.AssetID INNER JOIN
                            (SELECT      tblAssets.AssetID, SUM(CEILING(tblPhysicalMemory.Capacity / 1024 / 1024)) AS Memory, 
                                                      COUNT(tblPhysicalMemory.Win32_PhysicalMemoryid) AS Used
                              FROM           tblAssets LEFT OUTER JOIN
                                                      TsysMemorytypes RIGHT OUTER JOIN
                                                      tblPhysicalMemory ON TsysMemorytypes.Memorytype = tblPhysicalMemory.MemoryType ON 
                                                      tblAssets.AssetID = tblPhysicalMemory.AssetID
                              GROUP BY tblAssets.AssetID, tblPhysicalMemory.MemoryType
                              HAVING        (tblPhysicalMemory.MemoryType <> 11)) CorrectMemory ON CorrectMemory.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblPhysicalMemoryArray.[Use] = 3) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblPhysicalMemoryArray.MemoryDevices - CorrectMemory.Used DESC, dbo.tblAssets.AssetName