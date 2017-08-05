CREATE FUNCTION [dbo].[fn_getPrinterMaterialNorm]
(
)
RETURNS @returntable TABLE
(
	Id int null,
	AssetID int not null,
	AssetName nvarchar(200) not null,
	ModelSprav nvarchar(200)  null,
	PartNumber nvarchar(100)  null,
	Resource int  null,
	Yan int  null,
	Feb int  null,
	Mar int  null,
	Apr int  null,
	May int  null,
	Jun int  null,
	Jul int  null,
	Aug int  null,
	Sep int  null,
	Okt int  null,
	Nov int  null,
	Dec int  null,
	q1 int  null,
	q2 int  null,
	q3 int  null,
	q4 int  null,
	Ye int  null,
	HOrg nvarchar(255) null,
	Filial nvarchar(255) null,
	Gorod nvarchar(255)  null,
	Address nvarchar(255)  null,
	Office nvarchar(255)  null,
	Resp nvarchar(255)  null,
	idMaterialOriginal int null,
	IntenceOn bit null
)
AS
BEGIN
	INSERT @returntable
		select 
			n.Id,
			c.AssetID,
			a.AssetName,
			l.ModelSprav,
			o.PartNumber,
			o.Resource,
			n.Yan,
			n.Feb,
			n.Mar,
			n.Apr,
			n.May,
			n.Jun,
			n.Jul,
			n.Aug,
			n.Sep,
			n.Okt,
			n.Nov,
			n.Dec,
			n.Yan +	n.Feb +	n.Mar,
			n.Apr +	n.May +	n.Jun,
			n.Jul +	n.Aug +	n.Sep,
			n.Okt +	n.Nov +	n.Dec,
			n.Yan +	n.Feb +	n.Mar +	n.Apr +	n.May +	n.Jun +	n.Jul +	n.Aug +	n.Sep +	n.Okt +	n.Nov +	n.Dec,
			N'',
			c.Custom1,
			c.Custom2,
			c.Custom3,
			c.Custom4,
			c.Custom19,
			o.Id,
			o.IntenceOn

		from tblAssets as a 
		inner join tblAssetCustom as c on a.AssetId = c.AssetID
		inner join tsysAssetTypes as t on a.Assettype = t.AssetType
		left join rPrinterMaterialNorm as n on a.AssetID = n.AssetId
		left join rMaterialOriginal as o on n.idMaterialOriginal = o.Id
		left join rModelLink as l on c.Model = l.ModelAsset

		Where t.AssetTypename = N'Printer'


	RETURN
END
