/*
	Процедура начала планирования и инициации модуля планирования
	и добавление AssetId в модуль планирования по мере их добавления в Lansweeper
*/
CREATE PROCEDURE [dbo].[sp_PlanFirstStart]
AS
	Declare @ExDate datetime = null;
	declare @w nvarchar(50) = null;

	Set @w = 2016;
	Set @w = @w + '01' + '01';
	Set @ExDate = Convert(datetime, @w, 112);
	--print @ExDate


	insert into dbo.rPlanTimeSheet (AssetId, idState, Org, Filial, Gorod, Address, Office, idEmployee, idOU, isFinished, isApproved, ExDate)
	select 
		a.AssetID,
		9,				-- добавляем accet на склад, при этом расходные материалы не планируются
		c.Parent,
		ac.Custom1,
		ac.Custom2,
		ac.custom3,
		ac.custom4,
		e.id,
		e.parent_id,
		1,
		1,
		@ExDate
	from tblAssets as a 
	left join rPlanTimeSheet as p on a.AssetID = p.AssetId and p.ExDate = @ExDate
	inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
	left join rCompany$ as c on ac.Custom1 = c.Code
	left join rEmployee as e on ac.Custom16 = e.login
	Where p.AssetId is null


RETURN 0
