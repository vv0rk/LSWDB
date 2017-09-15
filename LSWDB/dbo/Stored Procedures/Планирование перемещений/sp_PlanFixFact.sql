/*
	Процедура фиксируем фактическое состояние на текущую дату
*/
CREATE PROCEDURE [dbo].[sp_PlanFixFact]
AS
	Declare @ExDate datetime = null;
	declare @w nvarchar(50) = null;

	Set @ExDate = GETDATE();
	--print @ExDate


	insert into dbo.rPlanTimeSheet (AssetId, idState, Org, Filial, Gorod, Address, Office, idEmployee, idOU, isFinished, isApproved, ExDate)
	select 
		a.AssetID,
		-- фиксируем статус оборудования
		ac.State,				
		-- организация и филиал
		c.Parent,
		ac.Custom1,
		-- место положения
		ac.Custom2,
		ac.custom3,
		ac.custom4,
		-- владелец 
		e.id,
		e.parent_id,
		-- данные подтверждены и зафиксированы
		1,
		1,
		-- дата среза
		@ExDate
	from tblAssets as a 
	left join rPlanTimeSheet as p on a.AssetID = p.AssetId and p.ExDate = @ExDate
	inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
	left join rCompany$ as c on ac.Custom1 = c.Code
	left join rEmployee as e on ac.Custom16 = e.login
	Where p.AssetId is null


RETURN 0
