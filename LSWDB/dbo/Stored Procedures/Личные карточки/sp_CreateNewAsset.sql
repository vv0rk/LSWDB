
/*
	создание новой записи в таблице rAssetsKSU
	все значения передаются через параметры

	создается сопутствующая запись в rAssetsImported
*/

CREATE PROCEDURE [dbo].[sp_CreateNewAsset]
	@name nvarchar(255) = 0,
	@inventoryNum nvarchar(32) = null,
	@serialNum nvarchar(32) = null,
	@orgOwner nvarchar(255) = null,
	@orgUser int = null,
	@count int = 1,
	@category int = 1,
	@gorod nvarchar(255) = null,
	@address nvarchar(255) = null,
	@user nvarchar(255) = null,
	@comment nvarchar(255) = null
AS
	declare @guid as UNIQUEIDENTIFIER;
	declare @date as datetime;
	declare @idksu as int;

	Select @guid = NEWID(), @date = GETDATE();

	-- проверка необходимых аргументов
	IF @name is null or @inventoryNum is null or @orgOwner is null or @orgUser is null 
		begin
			raiserror( N'Не определен один из аргументов: название, инвент №, организация владелец, организация пользователь', 12, 1);
			return 1;
		end 

	-- код организации владельца, название, инвентарный номер - должны быть уникальны
	IF EXISTS (
			Select *
			from rAssetsKsu as a
			where a.organization like @orgOwner and a.name like @name and a.inventoryNumber like @inventoryNum
		)
		begin 
			raiserror( N'В rAssetsKSU уже существует ассет: @orgOwner = %s, @name = %s, @inventNum = %s', 12, 2, @orgOwner, @name, @inventoryNum);
			return 1;
		end


	INSERT INTO rAssetsKSU (
		[name],
		[code],
		[inventoryNumber],
		[serialNumber],
		[organization],
		[companyId],
		[count],
		[categoryId],
		[room],
		[user],
		[withCategory],
		[registrationDate],
		[guid],
		[Comment] )
	VALUES (
		@name,
		@inventoryNum,
		@inventoryNum,
		@serialNum,
		@orgOwner,
		@orgUser,
		@count,
		@category,
		@gorod + N', ' + @address,
		@user,
		1,
		@date,
		@guid,
		@comment
	);

	Select @idksu = @@IDENTITY;

	-- создаем дополнительную запись для учета
	INSERT INTO rAssetsImported (
		[assetKsuId],
		[isLinked],
		[inventoryNumber],
		[serialNumber]
	)
	VALUES (	
		@idksu,
		0,
		@inventoryNum,
		@serialNum
	);

RETURN 0
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[sp_CreateNewAsset] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[sp_CreateNewAsset] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[sp_CreateNewAsset] TO [IE\UIT_USERS_VR]
    AS [dbo];

