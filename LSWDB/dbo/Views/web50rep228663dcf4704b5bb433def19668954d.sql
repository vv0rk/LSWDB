﻿CREATE VIEW dbo.web50rep228663dcf4704b5bb433def19668954d AS Select Top 1000000 tblAssetCustom.Custom1 As Организация, tblAssets.AssetID, tblAssets.AssetUnique, tblAssets.Domain, adu.name As [Имя пользователя], tsysOS.OSname, ProcCapacity.CPU, tblAssets.Memory, tblAssetCustom.Model, tblAssets.Lastseen, tsysOS.Image As icon From tblAssets Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID Inner Join tsysOS On tblAssets.OScode = tsysOS.OScode Inner Join (Select tblAssets.AssetID, Max(tblProcessor.MaxClockSpeed) As MaxClockSpeed, Count(tblProcessor.WIN32_PROCESSORid) As NrOfProcessors, Max(tblProcessor.MaxClockSpeed) As [total Proc Capacity], Max(tblProcessor.Architecture) As Architecture, Max(tblProcessor.Caption) As Name, Max(Replace(Replace(tblProcessor.Name, '(R)', ''), '(TM)', '')) As CPU From tblAssets Inner Join tblProcessor On tblAssets.AssetID = tblProcessor.AssetID Group By tblAssets.AssetID) ProcCapacity On ProcCapacity.AssetID = tblAssets.AssetID Left Join (Select adu.Username As username, adu.Name As name From tblADusers As adu Inner Join (Select Distinct adu.Username As username, Max(adu.ADUserID) As id From tblADusers As adu Group By adu.Username) As addu On adu.ADUserID = addu.id) As adu On tblAssets.Username = adu.username Where tblAssets.Memory < 2048 And tblAssetCustom.State = 1 Order By Организация, tblAssets.AssetName