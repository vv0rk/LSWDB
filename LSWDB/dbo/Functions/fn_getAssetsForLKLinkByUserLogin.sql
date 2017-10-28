CREATE FUNCTION [dbo].[fn_getAssetsForLKLinkByUserLogin]
(
	@userLogin nvarchar(150) = NULL
)
RETURNS @returntable TABLE
(
	-- уникальный идентификатор записей 
	iid int primary key identity(1,1),
	-- Id идентификатор rAssetsImported, если из Lansweeper то NULL 
	Id int null,
	-- Code из rAssetsKsu - номенклатурный код, если из Lansweeper то NULL 
	code nvarchar(32) null,
	-- name из rAssetsKsu - название номенклатуры, если из Lansweeper то AssetName 
	name nvarchar(255),
	-- inventoryNumber из rAssetsImported, если из Lansweeper то из tblAssetCustom может быть NULL если в Lansweeper этих данных также нет
	inventoryNumber nvarchar(255) NULL, 
	-- serialNumber из rAssetsImported, если из Lansweeper то tblAssetsCustom, может быть NULL если в Lansweeper этих данных также нет
	serialNumber nvarchar(100) NULL,
	-- mol из rAssetsKsu, NULL если asset пришел из Lansweeper
	mol nvarchar(255) NULL,
	-- organization из rAssetsKsu, NULL если asset пришел из Lansweeper
	organization nvarchar(255) NULL,
	-- assetId из rAssetsImported или из Lansweeper, может быт NULL если в rAssetsImported нет таких данных
	assetId int NULL,
	-- idScl из rAssetsImported, может быть NULL если устройство не привязано к пользователю (карточке)
	idScl int NULL,
	-- TypeSclad из rHScladType тип склада к которому привязан asset, может быть NULL если устройство к складу не привязано
	TypeSclad nvarchar(100) NULL,
	-- title из rEmployee может быть NULL если asset не привязан к складу
	title nvarchar(4000) NULL,
	-- StatusName из rHScladStatus может быть NULL если asset не привязан к складу
	StatusName nvarchar(100) NULL,
	-- isSelect поле для выбора нескольких записей всегда возвращается 0
	isSelect int NULL
)
AS
BEGIN

	IF (@userLogin is null) 
		begin
			INSERT @returntable
				select
					a.id
					, k.code
					, k.name
					, a.inventoryNumber
					, a.serialNumber
					, k.mol
					, k.organization
					, a.assetId
					, a.idScl
					, t.TypeSclad
					, e.title
					, hs.StatusName
					, a.isSelected
	
				from rAssetsImported as a
				inner join rAssetsKsu as k on a.assetKsuId = k.id
				left join rHSclad as s on a.idScl = s.Id
				left join rHScladType as t on s.idType = t.Id
				left join rEmployee as e on s.idResponce = e.id
				left join rHJournal as j on a.idJournal = j.Id
				left join rHJStatus as hs on j.idStatus = hs.Id

			union all 

				select 
					NULL as id,
					NULL as code,
					a.AssetName as name,
					ac.custom7 as inventoryNumber,
					ac.Serialnumber as serialNumber,
					N'НЕОПРЕДЕЛЕН' as mol,
					ac.Custom1 as organization,
					a.AssetID as assetId,
					NULL as idScl,
					NULL as TypeSclad,
					ac.Custom11 as title,
					NULL as StatusName,
					0 as isSelect
				from tblAssets as a
				inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
				left join rAssetsImported as ai on a.Assetid = ai.AssetId
				where ai.id is null
			END
		ELSE
			BEGIN
			-- возвращаем из Lansweeper только те асеты которые привязаны к пользователям
				INSERT @returntable
					select 
						NULL as id,
						NULL as code,
						a.AssetName as name,
						ac.custom7 as inventoryNumber,
						ac.Serialnumber as serialNumber,
						N'НЕОПРЕДЕЛЕН' as mol,
						ac.Custom1 as organization,
						a.AssetID as assetId,
						NULL as idScl,
						NULL as TypeSclad,
						ac.Custom11 as title,
						NULL as StatusName,
						0 as isSelect
					from tblAssets as a
					inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
					where ac.Custom17 = @userLogin
			END

	RETURN
END

GO

