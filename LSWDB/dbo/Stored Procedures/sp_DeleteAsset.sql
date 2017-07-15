
/*
	возможно удалять только ассеты внесенные в ручную
*/
CREATE PROCEDURE [dbo].sp_DeleteAsset
	@idAsset int = 0
AS
	declare @comment as nvarchar(255);
	declare @idKsu as nvarchar(255);

	Select @comment = k.Comment, @idKsu = k.id
		from rAssetsImported as a 
		inner join rAssetsKsu as k on a.assetKsuId = k.id
		where a.id = @idAsset;

	IF @comment is null
		begin 
			raiserror(N'Этот Ассет внесен не в ручном режиме, необходимо связаться с отделом учета ИТ активов',10,10);
			return 1;
		end 

	delete from rAssetsImported Where rAssetsImported.id = @idAsset
	delete from rAssetsKSU Where rAssetsKsu.id = @idKsu

RETURN 0