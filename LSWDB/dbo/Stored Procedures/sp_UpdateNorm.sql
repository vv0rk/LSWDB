CREATE PROCEDURE [dbo].[sp_UpdateNorm]
	@AssetId int = NULL,
	@idMaterialOriginal int = NULL,
	@MaterialOriginal nvarchar(100) = NULL,
	@Month nvarchar(3) = NULL,
	@Norm int = NULL
AS
	Declare @id int = NULL;
	Declare @idModelSprav int = NULL;
	Declare @sql nvarchar(200) = NULL;

	IF (@MaterialOriginal is not null) 
		BEGIN
			Select @idMaterialOriginal = dbo.rMaterialOriginal.Id from dbo.rMaterialOriginal Where dbo.rMaterialOriginal.PartNumber = @MaterialOriginal
		END

	-- проверяем что @AssetId и @idMaterialOriginal заданы и они существуют
	IF not exists (Select a.AssetID
						From dbo.tblAssets as a
						Where a.AssetID = @AssetId
					)
		BEGIN 
			raiserror(N'Асета %u отсутствует', 10, 1, @AssetId);
			return 1;
		END

	IF not exists (Select a.id
						From dbo.rMaterialOriginal as a
						Where a.Id = @idMaterialOriginal
					)
		BEGIN 
			raiserror(N'Расходный материал %u отсутствует', 10, 1, @idMaterialOriginal);
			return 1;
		END

	-- проверяем что модель и расходный материал совместимы
	IF not exists ( select c.Id
						from rModelComplect as c
						inner join rModelDevice as d on c.IdModel = d.Id
						inner join rModelLink as l on d.Model like l.ModelSprav
						inner join tblAssetCustom as a on l.ModelAsset like a.Model
						inner join rMaterialOriginal as o on c.IdMaterialOriginal = o.Id
						inner join rModelComplectStatus as s on c.IdStatus = s.Id
						Where s.Status like N'ДА'
					)
		BEGIN
			raiserror(N'Запрашиваемый расходный материал %u не разрешен для модели %u', 10, 2, @idMaterialOriginal, @AssetId);
			return 1;
		END
					
	Select @id = n.id
					from dbo.rPrinterMaterialNorm as n
					where n.AssetId = @AssetId and n.idMaterialOriginal = @idMaterialOriginal;

	IF (@id is null)
		BEGIN
			insert into dbo.rPrinterMaterialNorm ( AssetId, idMaterialOriginal )
				VALUES (@AssetID, @idMaterialOriginal)

			Select @id = @@IDENTITY;
		END

	IF not (@Month like N'Yan' or @Month like N'Feb' or @Month like N'Mar' or @Month like N'Apr' or @Month like N'May' 
		or @Month like N'Jun' or @Month like N'Jul' or @Month like N'Aug' or @Month like N'Sep' or @Month like N'Okt'
		or @Month like N'Nov' or @Month like N'Dec')
		BEGIN 
			raiserror(N'Месяц %s определен не корректно', 10, 2, @Month);
			return 1;
		END

	IF (@Norm is null)
		BEGIN
			Select @Norm = 0
		END

	Set @sql = N'UPDATE dbo.rPrinterMaterialNorm ' + N'SET dbo.rPrinterMaterialNorm.' + @Month + N' = ' + Convert(nvarchar(100), @Norm) + ' Where dbo.rPrinterMaterialNorm.Id = ' + Convert(nvarchar(100), @id)

	EXEC(@sql);
RETURN 0
