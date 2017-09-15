/*
	получить текущее состояние оборудования для перепланирования
	на будущие периоды.
	Данные должны быть достаточные для включения в rPlanTimeSheet
*/
CREATE FUNCTION [dbo].[fn_getCurrentStateAssets]
(
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
		Where YEAR(p.ExDate) = YEAR(@cDate) and DATEPART(quarter, p.ExDate) = DATEPART(quarter, @cDate)
	) as p 
	Where p.RN = 1
	RETURN
END
