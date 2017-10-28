/*
	устанавливает/снимает флаг для выбранной строки 
*/
CREATE PROCEDURE [dbo].[sp_selectRow]
	@id int = NULL,
	@isSelect int = NULL
AS
	declare @currentState bit = NULL;

	if @id is NULL 
		begin 
			return 1
		end

	Select @currentState = ai.isSelected
	from rAssetsImported as ai
	where ai.id = @id;

	update rAssetsImported 
	Set isSelected = @isSelect
	from rAssetsImported
	Where rAssetsImported.id = @id;

RETURN 0
