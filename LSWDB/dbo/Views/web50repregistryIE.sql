

CREATE VIEW [dbo].[web50repregistryIE]
AS
Select Top 1000000 tblassets.AssetID,
  tblassets.AssetName,
  tblassets.Domain,
  tblregistry.Regkey,
  tblregistry.Valuename,
  tblregistry.Value,
  tblregistry.Lastchanged
From tblassets
  Inner Join tblregistry On tblassets.AssetID = tblregistry.AssetID
Where tblregistry.Regkey Like '%internet explorer' And tblassets.Assettype = -1
Order By tblassets.AssetName
