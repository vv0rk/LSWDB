/*
	Удаляем назначенный ресурс попутно удаляя связанную запись из rPrintHistory
*/
CREATE PROCEDURE [dbo].[sp_dismissRashod]

	@idRashod int = 0
AS
	declare @idPrintHist int = null;
	declare @Username nvarchar(100) = null;

	Set @Username = SUSER_NAME();

	IF @idRashod is null
		begin
			return 1;
		end

	--select @idPrintHist = p.Id
	--from rMaterialRashod as r
	--left join rPrintHist as p on @idRashod = p.IdMaterialRashod
	--where r.id = @idRashod;

	--delete from dbo.rMaterialRashod Where dbo.rMaterialRashod.Id = @idRashod;
	--delete from dbo.rPrintHist Where dbo.rPrintHist.IdMaterialRashod = @idRashod
	update dbo.rMaterialRashod
	set dbo.rMaterialRashod.isRemoved = 1,
	    dbo.rMaterialRashod.Username = @Username
	where dbo.rMaterialRashod.Id = @idRashod;

RETURN 0
