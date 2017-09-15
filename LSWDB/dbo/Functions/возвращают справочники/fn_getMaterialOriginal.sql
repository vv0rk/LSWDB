-- Выдает перечень оригинальных расходных материалов

CREATE FUNCTION [dbo].[fn_getMaterialOriginal]
(
)
RETURNS @retMaterialOriginal TABLE 
(
	Id int primary key Not null,
	partNumber nvarchar(100),
	Name nvarchar(255),
	Resource int,
	IntenceOn bit, 
	Manufacturer nvarchar(100)
)
as 
BEGIN
	INSERT @retMaterialOriginal
	select 
		o.id,
		o.PartNumber,
		o.Name,
		o.Resource,
		o.IntenceOn,
		m.ShortName as 'Manufacturer'
	from dbo.rMaterialOriginal as o
	inner join dbo.rManufacturer as m on o.IdManufacturer = m.Id

	return
END;
