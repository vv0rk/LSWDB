/*
	Процедура начала планирования и инициации модуля планирования
*/
CREATE PROCEDURE [dbo].[sp_PlanFirstStart]
AS
	insert into dbo.rPlanTimeSheet (AssetId, idState, Org, Filial, Gorod, Address, Office, idEmployee, idOU, isFinished, isApproved, ExDate)
	select 
		a.AssetID,
		ac.State,
		c.Parent,
		ac.Custom1,
		ac.Custom2,
		ac.custom3,
		ac.custom4,
		e.id,
		e.parent_id,
		1,
		1,
		getdate()

	from tblAssets as a 
	inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
	left join rCompany$ as c on ac.Custom1 = c.Code
	left join rEmployee as e on ac.Custom16 = e.login
RETURN 0
