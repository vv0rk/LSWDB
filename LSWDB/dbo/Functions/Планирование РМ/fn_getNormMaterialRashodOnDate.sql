/*
	возвращает нормы действующие на заданный период
	если @tDate = NULL, то возвращает нормы на текущую дату
*/
CREATE FUNCTION [dbo].fn_getNormMaterialRashodOnDate
(
	@tDate datetime = null
)
RETURNS @returntable TABLE
(
	id int null,
	AssetId int null,
	idMaterialOriginal int null,
	Date datetime null,
	Quantity int null,
	idAlgoritm int null,
	Username nvarchar(255) null,
	isApproved bit null
)
AS
BEGIN
	declare @cDate datetime = getdate();
	declare @flag int = 0;

	Set @flag =(YEAR(@tDate)-YEAR(@cDate)) * 4 + (DATEPART(QUARTER, @tDate) - DATEPART(QUARTER, @cDate) )

	IF @tDate is null
		begin
			INSERT @returntable
			select 
				p.Id,
				p.AssetId,
				p.idMaterialOriginal,
				p.Date,
				p.Quantity,
				p.idAlgoritm,
				p.Username,
				p.isApproved
			from (
				select 
					p.*,
					a.AlgoritmName
				from rNormMaterialRashod as p
				inner join rNormAlgoritm as a on p.idAlgoritm = a.Id
			) as p 
		end
	ELSE
		begin
			INSERT @returntable
			select 
				p.Id,
				p.AssetId,
				p.idMaterialOriginal,
				p.Date,
				p.Quantity,
				p.idAlgoritm,
				p.Username,
				p.isApproved
			from (
				select 
					ROW_NUMBER () over( partition by p.assetid order by p.date desc) as RN,
					p.*,
					a.AlgoritmName
				from rNormMaterialRashod as p
				inner join rNormAlgoritm as a on p.idAlgoritm = a.Id
				Where YEAR(p.Date) = YEAR(@tDate) and DATEPART(quarter, p.Date) = DATEPART(quarter, @tDate)
			) as p 
			Where p.RN = 1;
		end

	RETURN
END
