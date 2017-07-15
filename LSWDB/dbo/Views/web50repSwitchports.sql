

CREATE view [web50repSwitchports] AS 
SELECT aaa.AssetID, aaa.icon, aaa.AssetName, aaa.[If], aaa.Type, aaa.Admin, aaa.MTU, aaa.Speed, aaa.[IP Address], aaa.Mask, aaa.Portname, aaa.Vlan, 
									aaa.MacAddress, tsysAssetTypes_1.AssetTypeIcon16 AS icon2, aaa.deviceassetid, tblAssets.AssetName AS deviceassetname, aaa.AssetMacAddress, 
									tblAssets.Description, tblAssetCustom.Manufacturer, tblAssetCustom.Model, tblAssetCustom.Location, tsysIPLocations.IPLocation, tblAssets.Firstseen, 
									tblAssets.Lastseen
FROM            (SELECT        TOP (1000000) tblAssets_1.AssetID, tsysAssetTypes.AssetTypeIcon16 AS icon, tblAssets_1.AssetName, tblSNMPInfo.IfIndex AS [If], 
                                                    tblSNMPIfTypes.IfTypename AS Type, 
                                                    CASE WHEN tblSNMPInfo.IfAdminstatus = 1 THEN 'Up' WHEN tblSNMPInfo.IfAdminstatus = 2 THEN 'Down' ELSE 'Testing' END AS Admin, 
                                                    tblSNMPInfo.IfMTU AS MTU, CASE WHEN (tblSNMPInfo.IfSpeed IS NULL OR
                                                    tblSNMPInfo.IfSpeed = 0) THEN '' WHEN tblSNMPInfo.IfSpeed > 999999999 THEN CONVERT(nvarchar(255), 
                                                    CAST(tblSNMPInfo.IfSpeed / 1000000000 AS float)) + 'Gbit' WHEN tblSNMPInfo.IfSpeed > 999999 THEN CONVERT(nvarchar(255), 
                                                    CAST(tblSNMPInfo.IfSpeed / 1000000 AS float)) + 'Mbit' ELSE CONVERT(nvarchar(255), CAST(tblSNMPInfo.IfSpeed / 1000 AS float)) + 'Kbit' END AS Speed, 
                                                    tblSNMPInfo.IfIPAddress AS [IP Address], tblSNMPInfo.IfMask AS Mask, tblSNMPInfo.IfMacaddress AS MacAddress, 
                                                    tblSNMPAssetMac.AssetMacAddress, tblSNMPInfo.Portname, tblSNMPInfo.Vlan, tblAssetMacAddress.AssetID AS deviceassetid
                          FROM            tblSNMPInfo INNER JOIN
                                                    tblAssets AS tblAssets_1 ON tblSNMPInfo.AssetID = tblAssets_1.AssetID INNER JOIN
                                                    tsysAssetTypes ON tblAssets_1.Assettype = tsysAssetTypes.AssetType LEFT OUTER JOIN
                                                    tblSNMPIfTypes ON tblSNMPInfo.IfType = tblSNMPIfTypes.IfType LEFT OUTER JOIN
                                                    tblAssetMacAddress RIGHT OUTER JOIN
                                                    tblSNMPAssetMac ON tblAssetMacAddress.Mac = tblSNMPAssetMac.AssetMacAddress ON tblSNMPInfo.IfIndex = tblSNMPAssetMac.IfIndex AND 
                                                    tblSNMPInfo.AssetID = tblSNMPAssetMac.AssetID
                          WHERE        (tblAssets_1.AssetID IS NOT NULL) AND (tblAssets_1.Assettype = 6)
                          ORDER BY tblAssets_1.AssetName, [If]) AS aaa LEFT OUTER JOIN
                         tblAssets ON aaa.deviceassetid = tblAssets.AssetID LEFT OUTER JOIN
                         tsysAssetTypes AS tsysAssetTypes_1 ON tblAssets.Assettype = tsysAssetTypes_1.AssetType INNER JOIN 
                         tblAssetCustom ON tblAssetCustom.AssetID = tblAssets.AssetID LEFT OUTER JOIN
                         tsysIPLocations ON tblAssets.LocationID = tsysIPLocations.LocationID