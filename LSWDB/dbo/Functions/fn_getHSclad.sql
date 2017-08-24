-- возвращает перечень складов
-- входной параметр тип склада 
CREATE FUNCTION [dbo].fn_getHSclad(
	@TypeSclad nvarchar(255) = null
	)
RETURNS @getHSclad TABLE
(
	id int primary key not null,
	Name nvarchar(255) null,
	idTypeSclad int not null,
	TypeSclad nvarchar(255) not null,
	idResponce int null,
	JobTitle nvarchar(255) null,
	Responce nvarchar(255) null,
	statusSclad int null,
	Org nvarchar(255) null,
	Filial nvarchar(255) null,
	Gorod nvarchar(255) null,
	Address  nvarchar(255) null,
	Office  nvarchar(255) null,
	Removed bit null,
	idFilial int null,
	Login nvarchar(255) null

)
as 
begin
	IF @TypeSclad is null
		begin
			Insert into @getHSclad
			select 
				s.id
				, s.Name
				, t.Id
				, t.TypeSclad
				, s.idResponce
				, e.post
				, e.title
				, s.idStatus
				, c.Parent
				, cc.Code
				, s.Gorod
				, s.Adress
				, s.Office
				, e.removed
				, c.id
				, e.login
			from rHSclad as s 
			left join rHScladType as t on s.idType = t.Id
			left join rHScladStatus as hs on s.idStatus = hs.Id 
			left join rEmployee as e on s.idResponce = e.id
			left join rCompany$ as c on s.idCompany = c.id
			left join rCompany$ as cc on s.idFilial = cc.id
		end
	IF @TypeSclad = N'С'
		begin
			Insert into @getHSclad
			select 
				s.id
				, s.Name
				, t.Id
				, t.TypeSclad
				, s.idResponce
				, e.post
				, e.title
				, s.idStatus
				, c.Parent
				, cc.Code
				, s.Gorod
				, s.Adress
				, s.Office
				, e.removed
				, c.id
				, e.login
			from rHSclad as s 
			left join rHScladType as t on s.idType = t.Id
			left join rHScladStatus as hs on s.idStatus = hs.Id 
			left join rEmployee as e on s.idResponce = e.id
			left join rCompany$ as c on s.idCompany = c.id
			left join rCompany$ as cc on s.idFilial = cc.id
			Where t.TypeSclad like N'%С'
		end
	ELSE	
		begin
			Insert into @getHSclad
			select 
				s.id
				, s.Name
				, t.Id
				, t.TypeSclad
				, s.idResponce
				, e.post
				, e.title
				, s.idStatus
				, c.Parent
				, cc.Code
				, s.Gorod
				, s.Adress
				, s.Office
				, e.removed
				, c.id
				, e.login
			from rHSclad as s 
			left join rHScladType as t on s.idType = t.Id
			left join rHScladStatus as hs on s.idStatus = hs.Id 
			left join rEmployee as e on s.idResponce = e.id
			left join rCompany$ as c on s.idCompany = c.id
			left join rCompany$ as cc on s.idFilial = cc.id
			Where t.TypeSclad = @TypeSclad
		end
	return
 end;