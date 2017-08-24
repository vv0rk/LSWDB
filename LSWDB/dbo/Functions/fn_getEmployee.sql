﻿CREATE FUNCTION [dbo].[fn_getEmployee]
(
	-- возвращает информацию о сотрудниках 
	@Org nvarchar(255) = null
	--@Name nvarchar(255) = null
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
	idp int null						-- идентификатор пользователя

)
AS
BEGIN


	with job (level, title, id, parent_id, name, login, jobtitle, org, idShtat, email, removed, removal_date, idp) as (
		-- закрепленная часть 
		select 	0 as level, o.title, o.id, o.parent_id, e.title, e.login, e.post, c.Parent, e.parent_id, e.email, e.removed, e.removal_date, e.id
		from dbo.rOU as o 
		inner join dbo.rEmployee as e on o.id = e.parent_id
		inner join (
			select c.Parent, c.IdOU
			from dbo.rCompany$ as c
			where c.isOrg = 1
		) as c on e.organization = c.IdOU
		--Where e.title like N'Савин Николай Влади%'
		--Where o.parent_id is null
		union all 
		select level + 1, t.title + N'\' + j.title, t.id, t.parent_id, j.name, j.login, j.jobtitle, j.org, j.idShtat, j.email, j.removed, j.removal_date, j.idp
		from job as j
		inner join rOU as t on j.parent_id = t.id
		where j.parent_id is not null
	)

	INSERT @retEmployee
	select s.id, s.org, SUBSTRING(s.title, 0, 254), s.jobtitle, s.name, s.login, s.idShtat, s.email, s.removed, s.removal_date, s.idp
	from job as s
	where s.parent_id is null

	-- здесь разделяем Departament по нескольким уровням
	RETURN
END