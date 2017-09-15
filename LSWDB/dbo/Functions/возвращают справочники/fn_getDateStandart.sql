/*
	принимает произвольную дату,
	возвращает дату приведенную на начало квартала
	эта функция используется регулярно 
*/
CREATE FUNCTION [dbo].[fn_getDateStandart]
(
	@tDate datetime
)
RETURNS Datetime
AS
BEGIN
	declare @pDate datetime = null;
	declare @ss nvarchar(100) = null;
	declare @m nvarchar(4) = null;
	declare @d nvarchar(4) = '01';

	IF(@tDate is null )
		begin
			return NULL
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

	RETURN @pDate
END
