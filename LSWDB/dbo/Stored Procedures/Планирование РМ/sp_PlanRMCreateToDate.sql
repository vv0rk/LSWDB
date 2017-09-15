/*
создаем план на определенный квартал
дата не должна быть больше чем текущая (минимум следующий квартал
*/
CREATE PROCEDURE [dbo].[sp_PlanRMCreateToDate]
	@PlanDate datetime = '20160101'

AS
	Declare @Year int = null;
	declare @Quarter int = null;
	Declare @cYear int = null;
	declare @cQuarter int = null;
	declare @nPlanDate datetime = null;
	Declare @w nvarchar(20) = null;

	set @Year = year(getdate());
	set @Quarter = DATEPART(quarter,getdate());
	print @year;
	print @Quarter;
	set @cYear = year(@PlanDate);
	set @cQuarter = DATEPART(quarter, @PlanDate);
	print @cyear;
	print @cQuarter;

	IF (@cYear * 10 + @cQuarter) <= (@Year * 10 + @Quarter) 
		begin 
			raiserror('Дата планирования не может быть ранее текущей даты',10,1);
			return 1;
		end

	IF @cQuarter = 1 
		begin 
			Set @w = @cYear;
			Set @w = @w + '01' + '01';
			Set @nPlanDate = Convert(datetime, @w, 112);
		end
	IF @cQuarter = 2
		begin 
			Set @w = @cYear;
			Set @w = @w + '04' + '01';
			Set @nPlanDate = Convert(datetime, @w, 112);
		end
	IF @cQuarter = 3
		begin 
			Set @w = @cYear;
			Set @w = @w + '07' + '01';
			Set @nPlanDate = Convert(datetime, @w, 112);
		end
	IF @cQuarter = 4
		begin 
			Set @w = @cYear;
			Set @w = @w + '10' + '01';
			Set @nPlanDate = Convert(datetime, @w, 112);
		end

	-- создаем план потребления на требуемый квартал
	insert into dbo.rPlanRMTimeSheet( AssetId, idMaterialOriginal, Quantity, Date)
	select p.AssetId, p.idMaterialOriginal, 1, @nPlanDate
	from dbo.rPlanRMTimeSheet as p
	left join dbo.rPlanRMTimeSheet as t on p.AssetId = t.AssetId and p.idMaterialOriginal = t.idMaterialOriginal and p.Date = @nPlanDate
	Where p.isActive = 1

RETURN 0
