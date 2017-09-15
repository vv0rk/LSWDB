/*
	выдает планируемое состояние оборудования на запрашиваемый квартал
	если план не определен, то завершается ошибкой
	если предыдущий план попадает на текущий период то вызывает fn_getCurrentStateAssets 
*/
CREATE FUNCTION [dbo].fn_getPlanStateAssetsOnDate
(
	@tDate datetime = null
)
RETURNS @returntable TABLE
(
	AssetId int null,
	idState int null,
	Org nvarchar(50) null,
	Filial nvarchar(50) null,
	Gorod nvarchar(255) null,
	Address nvarchar(255) null,
	Office nvarchar(255) null,
	idEmployee bigint null,
	idOU bigint null,
	ExDate datetime null,
	isAttention bit null,
	isFinished bit null,
	isApproved bit null
)
AS
BEGIN
	declare @cDate datetime = getdate();
	declare @flag int = 0;

	Set @flag =(YEAR(@tDate)-YEAR(@cDate)) * 4 + (DATEPART(QUARTER, @tDate) - DATEPART(QUARTER, @cDate) )

	IF @flag > 0
		begin
			INSERT @returntable
			select 
				p.AssetId,
				p.idState,
				p.Org,
				p.Filial,
				p.Gorod,
				p.Address,
				p.Office,
				p.idEmployee,
				p.idOU,
				p.ExDate,
				0,
				0,
				0
			from (
				select 
					ROW_NUMBER () over( partition by p.assetid order by p.exdate desc) as RN,
					p.AssetId,
					p.idState,
					p.Org,
					p.Filial,
					p.Gorod,
					p.Address,
					p.Office,
					p.idEmployee,
					p.idOU,
					p.ExDate
				from rPlantimeSheet as p
				Where YEAR(p.ExDate) = YEAR(@tDate) and DATEPART(quarter, p.ExDate) = DATEPART(quarter, @tDate)
			) as p 
			Where p.RN = 1;
		end
	else
		begin 
			INSERT @returntable
			select 
				p.AssetId,
				p.idState,
				p.Org,
				p.Filial,
				p.Gorod,
				p.Address,
				p.Office,
				p.idEmployee,
				p.idOU,
				p.ExDate,
				0,
				0,
				0
			from fn_getCurrentStateAssets() as p;
		end
	RETURN
END
