

--- New report ---
CREATE VIEW [dbo].[web50repChartAssetSum]
AS
Select Top 1000000 Case Coalesce(tblAssetCustom.Manufacturer, '')
    When '' Then 'Unknown' Else Coalesce(tblAssetCustom.Manufacturer, '')
  End As AssetManufacturer,
  Count(tblAssets.AssetID) As Total
From tblAssets
  Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID
Where tblAssetCustom.State = 1
Group By Case Coalesce(tblAssetCustom.Manufacturer, '') When '' Then 'Unknown'
    Else Coalesce(tblAssetCustom.Manufacturer, '') End
Order By Total Desc