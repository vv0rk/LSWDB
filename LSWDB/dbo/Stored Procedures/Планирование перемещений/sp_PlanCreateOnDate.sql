/*
	формирует квартальный план по состоянию оборудования на tDate
	на основе плана или последнего состояния на дату cDate
*/
CREATE PROCEDURE [dbo].[sp_PlanCreateOnDate]
	@tDate datetime = null,
	@cDate datetime = null
AS
declare @pDate datetime = null;
declare @ss nvarchar(100) = null;
declare @m nvarchar(4) = null;
declare @d nvarchar(4) = '01';

IF(@tDate is null or @tDate < GETDATE())
	begin
		raiserror(N'Планируемая дата не может быть менее текущей', 1000,1);
		return 1
	end

IF(@cDate is null)
	begin
		Set @cDate = GETDATE()
	end

IF DATEPART(QUARTER, @tDate) = 1
	begin 
		Set @m = '01'
	end
IF DATEPART(QUARTER, @tDate) = 2
	begin 
		Set @m = '04'
	end
IF DATEPART(QUARTER, @tDate) = 3
	begin 
		Set @m = '07'
	end
IF DATEPART(QUARTER, @tDate) = 4
	begin 
		Set @m = '10'
	end

Set @ss = YEAR(@tDate) 
Set @ss = @ss + @m + @d
Set @pDate = convert(datetime,@ss)

INSERT INTO dbo.rPlanTimeSheet( AssetId, idState, ExDate, Org, Filial, Gorod, Address, Office, idEmployee, idOU, isAttention, isApproved, isFinished)
select 
	pc.AssetId,
	pc.idState,
	@pDate,
	pc.Org,
	pc.Filial,
	pc.Gorod,
	pc.Address,
	pc.Office,
	pc.idEmployee,
	pc.idOU,
	0,
	0,
	1
from fn_getPlanStateAssetsOnDate(@cDate) as pc
left join fn_getPlanStateAssetsOnDate(@tDate) as pt on pc.AssetId = pt.AssetId
where pt.AssetId is null 
RETURN 0
