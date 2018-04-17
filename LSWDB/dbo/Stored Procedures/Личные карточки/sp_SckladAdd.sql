CREATE PROCEDURE [dbo].[sp_SckladAdd]
	@id int = NULL,
	@Name nvarchar(255) = NULL,
	--@idCompany int = NULL,
	@Org nvarchar(255) = NULL,
	--@idFilial int = NULL,
	@Filial nvarchar(255) = NULL,
	--@idResponce int = NULL,
	@ResponceLogin nvarchar(255) = null,
	@Gorod nvarchar(255) = NULL,
	@Address nvarchar(255) = NULL,
	@Office nvarchar(255) = NULL,
	@Type nvarchar(255) = NULL, 
	@Action nvarchar(255) = NULL
AS


	Declare @EmployeeName nvarchar(255) = NULL;
	declare @idCompany int = null;
	Declare @idFilial int = null;
	Declare @idResponce int = null;
	Declare @idTypeSclad int = null;

	--IF @id is not null-- and @Action like 'Delete'
	--	begin
	--		delete from dbo.rHSclad 
	--		where dbo.rHSclad.Id = @id;
	--		return ;
	--	end 

	-- select @EmployeeName = dbo.rEmployee.title from dbo.rEmployee where dbo.rEmployee.id = @idResponce and dbo.rEmployee.removed = 0;
	select @EmployeeName = dbo.rEmployee.title, @idResponce = dbo.rEmployee.id from dbo.rEmployee where dbo.rEmployee.login = @ResponceLogin and dbo.rEmployee.removed = 0;

	IF @EmployeeName is null 
		begin 
			raiserror( N'Пользователь login: %s ФИО: %s id: %i не существует или уволен', 12, 2, @ResponceLogin, @EmployeeName, @idResponce);
			return 1;
		end

	IF @Org is not null and @idCompany is null
		begin
			select @idCompany = c.id from rCompany$ as c where c.isOrg = 1 and c.Parent = @Org
		end

	IF @Filial is not null and @idFilial is null
		begin
			select @idFilial = c.id from rCompany$ as c where c.Code = @Filial
			raiserror( N'Проверка: %i : %s : ', 10, 2, @idFilial, @Filial);
		end

	IF @Type is not null 
		begin
			Select @idTypeSclad = dbo.rHScladType.Id from dbo.rHScladType where dbo.rHScladType.TypeSclad = @Type
		end

	IF @idTypeSclad is null 
		begin 
			Select @idTypeSclad = dbo.rHScladType.Id from dbo.rHScladType where dbo.rHScladType.TypeSclad like N'ЦС'
		end

	-- если склад существует то обновляем существующий
	IF not exists (select * from rHSclad where dbo.rHSclad.id = @id)
		begin 
			insert into dbo.rHSclad (
				Name,
				idCompany,
				idFilial,
				idResponce,
				Gorod,
				Adress,
				Office,
				idType
			)
			VALUES (
				@Name,
				@idCompany,
				@idFilial,
				@idResponce,
				@Gorod,
				@Address,
				@Office,
				@idTypeSclad
			)
		end
	ELSE
		begin
			IF @Name is not NULL 
				begin
					update dbo.rHSclad 
					Set dbo.rHSclad.Name = @Name
					Where dbo.rHSclad.Id = @id
				end
			IF @Gorod is not NULL 
				begin
					update dbo.rHSclad 
					Set dbo.rHSclad.Gorod = @Gorod 
					Where dbo.rHSclad.Id = @id
				end
			IF @Address is not NULL 
				begin
					update dbo.rHSclad 
					Set dbo.rHSclad.Adress = @Address
					Where dbo.rHSclad.Id = @id
				end
			IF @Office is not NULL 
				begin
					update dbo.rHSclad 
					Set dbo.rHSclad.Office = @Office
					Where dbo.rHSclad.Id = @id
				end
			IF @EmployeeName is not NULL 
				begin
					update dbo.rHSclad 
					Set dbo.rHSclad.idResponce = @idResponce
					Where dbo.rHSclad.Id = @id
				end
			IF @idCompany is not NULL 
				begin
					update dbo.rHSclad 
					Set dbo.rHSclad.idCompany = @idCompany
					Where dbo.rHSclad.Id = @id
				end
			IF @idFilial is not NULL 
				begin
					update dbo.rHSclad 
					Set dbo.rHSclad.idFilial = @idFilial
					Where dbo.rHSclad.Id = @id
				end
		end

RETURN 0
