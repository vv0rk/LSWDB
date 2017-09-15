/*
	выдает планируемое состояние оборудования на запрашиваемый квартал
	если план не определен, то завершается ошибкой
	если предыдущий план попадает на текущий период то вызывает fn_getCurrentStateAssets 
*/
CREATE FUNCTION [dbo].fn_getPlanStateOneAssetsOnDate
(
	@AssetId int,
	@tDate datetime = null
)
RETURNS bit
AS
BEGIN
	declare @cDate datetime = getdate();
	declare @flag int = 0;
	declare @ret bit = 0;

	select 
		@ret = p.isAttention
	from (
		select 
			ROW_NUMBER () over( partition by p.assetid order by p.exdate desc) as RN,
			p.isAttention
		from rPlantimeSheet as p
		Where YEAR(p.ExDate) = YEAR(@tDate) and DATEPART(quarter, p.ExDate) = DATEPART(quarter, @tDate)) as p Where p.RN = 1;

	RETURN @ret
END
