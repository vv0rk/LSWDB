CREATE PROCEDURE [dbo].[sp_AddNewMaterialOriginal]
	@partNumber nvarchar(100) = NULL,
	@Name nvarchar(200) = NULL,
	@Resource int = 0,
	@Manufacturer nvarchar(50) = NULL
AS
	Declare @idManufacturer int = 0;

	-- проверка аргументов производится базой

	Select @idManufacturer = m.Id
		from dbo.rManufacturer as m
	Where m.ShortName = @Manufacturer

	INSERT INTO dbo.rMaterialOriginal (
		[PartNumber],
		[Name],
		[Resource],
		[IdManufacturer]
	)
	VALUES (
		@partNumber,
		@Name,
		@Resource,
		@idManufacturer
		)

RETURN 0
