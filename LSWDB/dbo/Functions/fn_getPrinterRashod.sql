-- возвращает установленные расходные материалы на заданном устройстве
CREATE FUNCTION [dbo].[fn_getPrinterRashod]
(
	@AssetId int,
	@idMaterialOriginal int,
	@DateStart Datetime
)
RETURNS @returntable TABLE
(
	AssetId int not null,
	idMaterialOriginal int not null,
	printedPages int null,
	DateChange Datetime null,
	CommentMaterial nvarchar(100) null
)
AS
BEGIN

	IF @DateStart is null
		BEGIN
			INSERT @returntable
			SELECT 
				mr.AssetId,
				mr.IdMaterialAnalog,
				mr.PrintedPages,
				mr.Date,
				mr.Comment				
			FROM dbo.rMaterialRashod as mr
			WHERE mr.AssetId = @AssetId and mr.IdMaterialAnalog = @idMaterialOriginal
		END
	ELSE
		BEGIN
			INSERT @returntable
			SELECT 
				mr.AssetId,
				mr.IdMaterialAnalog,
				mr.PrintedPages,
				mr.Date,
				mr.Comment				
			FROM dbo.rMaterialRashod as mr
			WHERE mr.AssetId = @AssetId and mr.IdMaterialAnalog = @idMaterialOriginal and mr.Date >= @DateStart
		END
	RETURN
END
