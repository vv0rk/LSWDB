CREATE FUNCTION [dbo].[fn_getEmployeeSplited]
(
)
RETURNS @retEmployee TABLE
(
	id int,								-- Идентификатор пользователя
	Org nvarchar(255) null,				-- Организация из rCompany$.Parent
	Departament nvarchar(255) null,		-- Департамент сформирован как строка где подразделения разделены \
	JobTitle nvarchar(255) null,		-- должность
	Name nvarchar(255) null,			-- ФИО 
	Login nvarchar(255) null,			-- login
	idShtat int null,					-- уникальный идентификатор штатной единицы
	email nvarchar(255) null,
	removed bit null,					-- 0 сотрудник работает, не 0 уволен или еще чтото
	removal_date datetime null,			-- дата увольнения сотрудника
	-- уровни сплитнутого департамента
	level1 nvarchar(255) null,
	level2 nvarchar(255) null,
	level3 nvarchar(255) null,
	level4 nvarchar(255) null,
	level5 nvarchar(255) null,
	level6 nvarchar(255) null,
	level7 nvarchar(255) null,
	level8 nvarchar(255) null,
	level9 nvarchar(255) null
)
AS
BEGIN
	INSERT @retEmployee
	select 
		e.idp,
		e.Org,
		e.Departament,
		e.JobTitle,
		e.Name,
		e.Login,
		e.idShtat,
		e.email,
		e.removed,
		e.removal_date,
		dbo.fn_getSplitbit( e.Departament, N'\', 0),
		dbo.fn_getSplitbit( e.Departament, N'\', 1),
		dbo.fn_getSplitbit( e.Departament, N'\', 2),
		dbo.fn_getSplitbit( e.Departament, N'\', 3),
		dbo.fn_getSplitbit( e.Departament, N'\', 4),
		dbo.fn_getSplitbit( e.Departament, N'\', 5),
		dbo.fn_getSplitbit( e.Departament, N'\', 6),
		dbo.fn_getSplitbit( e.Departament, N'\', 7),
		dbo.fn_getSplitbit( e.Departament, N'\', 8)

	from fn_getEmployee(default) as e

	RETURN
END
