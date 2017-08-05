CREATE PROCEDURE [dbo].[sp_setIntence]
	@id int = NULL,
	@Intence float(4) = NULL
AS
	Declare @sql nvarchar(200) = NULL;


	Set @sql = N'UPDATE dbo.rMaterialSvod ' + N'SET dbo.rMaterialSvod.Intence = ' + Convert(nvarchar(100), @Intence) + ' Where dbo.rMaterialSvod.Id = ' + Convert(nvarchar(100), @id)

	EXEC(@sql);
	
RETURN 0
