CREATE PROCEDURE [dbo].[sp_AddNewMaterialOriginal]
	@partNumber nvarchar(100) = NULL,
	@Name nvarchar(200) = NULL,
	@Resource int = 0,
	@IntenceOn bit = 0,
	@Manufacturer nvarchar(50) = NULL
AS
	Declare @idManufacturer int = 0;
	--declare @idMaterialOriginal int = null;

	Select @idManufacturer = dbo.rManufacturer.Id from dbo.rManufacturer Where dbo.rManufacturer.ShortName = @Manufacturer
	-- проверка аргументов производится базой

	IF exists ( select * from dbo.rMaterialOriginal as mo where mo.PartNumber = @partNumber )
		BEGIN
			if @Name is not null 
				begin 
					update dbo.rMaterialOriginal
					Set dbo.rMaterialOriginal.Name = @Name
					Where dbo.rMaterialOriginal.PartNumber = @partNumber
				end
			if @Resource is not null 
				begin 
					update dbo.rMaterialOriginal
					Set dbo.rMaterialOriginal.Resource = @Resource
					Where dbo.rMaterialOriginal.PartNumber = @partNumber
				end
			if  @IntenceOn is not null 
				begin 
					update dbo.rMaterialOriginal
					Set dbo.rMaterialOriginal.IntenceOn = @IntenceOn
					Where dbo.rMaterialOriginal.PartNumber = @partNumber
				end
			if @idManufacturer is not null 
				begin 
					update dbo.rMaterialOriginal
					Set dbo.rMaterialOriginal.IdManufacturer = @idManufacturer
					Where dbo.rMaterialOriginal.PartNumber = @partNumber
				end
		END
	ELSE
		BEGIN
			Select @idManufacturer = m.Id
				from dbo.rManufacturer as m
			Where m.ShortName = @Manufacturer

			INSERT INTO dbo.rMaterialOriginal (
				[PartNumber],
				[Name],
				[Resource],
				[IntenceOn],
				[IdManufacturer]
			)
			VALUES (
				@partNumber,
				@Name,
				@Resource,
				@IntenceOn,
				@idManufacturer
				)
		END


RETURN 0
