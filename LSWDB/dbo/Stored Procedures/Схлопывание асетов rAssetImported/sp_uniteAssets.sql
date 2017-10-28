/*
	rAssetsImported
	Объединяем два выбранных ассета в один
	Приоритетным являются данные из бухгалтерии.

*/
CREATE PROCEDURE [dbo].[sp_uniteAssets]
AS
	--declare @num int = NULL;
	--declare @idsrc int = NULL;
	--declare @idtgt int = null;
	--declare @AssetId int = null;
	--declare @inventoryNumber nvarchar(32) = NULL;
	--declare @serialNumber nvarchar(32) = NULL;
	--declare @AssetKsuId int = null;
	--declare @idLinked bit = null;
	--declare @idScl int = null;
	--declare @idJournal int = null;

	--select @num = count(ai.id)
	--from rAssetsImported as ai
	--where ai.isSelected = 1
	--group by ai.isSelected

	--IF @num <> 2 
	--	begin
	--		exec sp_clearSelection;
	--		return 1;
	--	end

	---- предпочтение отдается значению у которого rAssetsKsu.Comment is NULL
	--Select @idtgt = @ai.id
	--from rAssetsImported as ai 
	--where ai.

RETURN 0
