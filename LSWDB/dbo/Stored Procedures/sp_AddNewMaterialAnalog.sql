CREATE PROCEDURE [dbo].[sp_AddNewMaterialAnalog]
	@partNumber nvarchar(100) = NULL,
	@Name nvarchar(200) = NULL,
	@Resource int = 0,
	@Manufacturer nvarchar(50) = NULL
AS
	Declare @idManufacturer int = 0;
	Declare @altName nvarchar(290) = NULL

	-- проверка аргументов производится базой

	Select @idManufacturer = m.Id
		from dbo.rManufacturer as m
	Where m.ShortName = @Manufacturer

	Set @altName = @Manufacturer + N'_' + @partNumber;

	INSERT INTO dbo.rMaterialAnalog(
		[PartNumber],
		[Name],
		[Resource],
		[IdManufacturer],
		[AltName]
	)
	VALUES (
		@partNumber,
		@Name,
		@Resource,
		@idManufacturer,
		@altName
		)

RETURN 0