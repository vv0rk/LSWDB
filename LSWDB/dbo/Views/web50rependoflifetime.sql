﻿

CREATE VIEW web50rependoflifetime AS Select Top 1000000 tsysOS.Image As icon, tblAssets.AssetID, tblAssets.AssetName, tblAssets.Domain, tblAssets.Username, tblAssets.Userdomain, tblAssets.IPAddress, tblAssets.Description, tblAssetCustom.Manufacturer, tblAssetCustom.Model, tblAssetCustom.Location, tsysIPLocations.IPLocation, tsysOS.OSname As OS, tblAssets.SP As SP, tblAssets.Firstseen, tblAssets.Lastseen From tblAssets Inner Join tblOperatingsystem On tblAssets.AssetID = tblOperatingsystem.AssetID Inner Join tsysOS On tsysOS.OScode = tblAssets.OScode Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID Left Join tsysIPLocations ON tblAssets.LocationID = tsysIPLocations.LocationID Where tblAssetCustom.State = 1 AND (tsysOS.OSname = 'NT 3.51' OR tsysOS.OSname = 'NT 4' OR tsysOS.OSname = 'Win 2000' OR tsysOS.OSname = 'Win 2000 S' OR tsysOS.OSname = 'Win XP' OR tsysOS.OSname = 'Win 2003' OR tsysOS.OSname = 'Win 2003 R2') Order By tsysOS.OSname, tblAssets.AssetName, tblOperatingsystem.Caption