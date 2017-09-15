/*
	Скалярная функция возвращает плановое значение РМ для заданного устройства
	1. проверяем кол-во в том же квартале год назад и isAttention = 0
	2. если год назад = 0 проверяем за текущий квартал и isAttention = 0, предполагается корректировка на конец квартала
	3. если предыдущий квартал = 0 проверяем предыдущий месяц и isAttention = 0
	4. если = 0 и isAttention = 0, ставим РМ = 1.
	5. если isAttention = 1, то рассчитываем кол-во РМ (число отпечатков / ресурс)* 5 / 12
*/
CREATE FUNCTION [dbo].[fn_getPrognozRMalgoritm]
(
	@AssetId int,
	@idMaterialOriginal int,
	@tDate datetime
)
RETURNS INT
AS
BEGIN
	--declare @tDate datetime = '20171001';
	--declare @AssetId int = 21163;
	--declare @idMaterialOriginal int = 33;
	Declare @retCount int = null;
	Declare @cDate datetime = null;
	Declare @ss nvarchar(50) = null;
	Declare @mm nvarchar(4) = null;

	-- проверяем что для устройства установлен isAttention и просто выходим и возвращаем NULL
	--IF exists (select * from dbo.fn_getPlanStateOneAssetsOnDate(@AssetId, @tDate))
	--	begin
	--		return NULL;
	--	end

	-- 1. отрабатываем вариант с годом ранее
	Set @mm = convert(nvarchar(4),MONTH(@tDate));
	IF LEN(@mm) = 1
		begin 
			Set @ss = convert(nvarchar(6),(YEAR(@tDate) - 1)) + '0' + @mm + '01';
		end
	ELSE 
		begin
			Set @ss = convert(nvarchar(6),(YEAR(@tDate) - 1)) + @mm + '01';
		end
	Set @cDate = convert(datetime, @ss);


	Select @retCount = SUM(r.number)
	from rMaterialRashod as r
	Where dbo.fn_getDateStandart(r.Date) = dbo.fn_getdatestandart(@cDate) and r.AssetId = @AssetId and r.idMaterialOriginal = @idMaterialOriginal
	group by r.assetid, r.idMaterialOriginal;
	
	IF @retCount > 0 
		begin 
			return @retcount;
		end
	-- 2 
	--IF DATEPART(QUARTER, @tDate) = 4 
	--	begin
	--		Set @ss = convert(nvarchar(6),(YEAR(@tDate) - 1)) + '10' + '01';
	--	end
	--ELSE
	--	begin
	--		Set @ss = convert(nvarchar(6),YEAR(@tDate)) + convert(nvarchar(4),(Month(dbo.fn_getDateStandart(@tDate)) - 1)) + '01';
	--		Set @cDate = dbo.fn_getDateStandart(@ss);
	--	end
	Set @cDate = @tDate;
	Select @retCount = SUM(r.number)
	from rMaterialRashod as r
	Where dbo.fn_getDateStandart(r.Date) = dbo.fn_getdatestandart(@cDate) and r.AssetId = @AssetId and r.idMaterialOriginal = @idMaterialOriginal
	group by r.assetid, r.idMaterialOriginal;

	IF @retCount > 0
		begin
			return @retCount;
		end
	-- 3 
	Set @retCount = 1;

	RETURN @retCount;
END
