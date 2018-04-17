CREATE TABLE [dbo].[tblAssetUserRelations] (
    [RelationID]  INT            IDENTITY (1, 1) NOT NULL,
    [Username]    NVARCHAR (150) NULL,
    [Userdomain]  NVARCHAR (150) NULL,
    [AssetID]     INT            NULL,
    [Type]        INT            NULL,
    [Comments]    NVARCHAR (150) NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblAssetUserRelations_LastChanged] DEFAULT (getdate()) NOT NULL,
    [StartDate]   DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([RelationID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblAssetUserRelations_tblADusers] FOREIGN KEY ([Username], [Userdomain]) REFERENCES [dbo].[tblADusers] ([Username], [Userdomain]) ON DELETE CASCADE,
    CONSTRAINT [FK_tblAssetUserRelations_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);

Go;

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,27/05/2017,>
/* Description:	<Универсальный триггер для записи логов по изменению данных>
	https://stackoverflow.com/questions/19737723/log-record-changes-in-sql-server-in-an-audit-table
*/
-- =============================================
CREATE TRIGGER TR_tblAssetUserRelations ON tblAssetUserRelations FOR UPDATE, insert, delete
AS

DECLARE @bit INT ,
       @field INT ,
       @maxfield INT ,
       @char INT ,
       @fieldname NVARCHAR(128) ,
       @TableName NVARCHAR(128) ,
       @PKCols NVARCHAR(1000) ,
       @sql NVARCHAR(2000), 
       @UpdateDate NVARCHAR(21) ,
       @UserName NVARCHAR(128) ,
       @Type CHAR(1) ,
       @PKSelect NVARCHAR(1000)


--You will need to change @TableName to match the table to be audited. 
-- Here we made GUESTS for your example.
SELECT @TableName = 'tblAssetUserRelations'

-- date and user
SELECT         @UserName = SYSTEM_USER ,
       @UpdateDate = CONVERT (NVARCHAR(30),GETDATE(),126)

-- Action
IF EXISTS (SELECT * FROM inserted)
       IF EXISTS (SELECT * FROM deleted)
               SELECT @Type = 'U'
       ELSE
               SELECT @Type = 'I'
ELSE
       SELECT @Type = 'D'

-- get list of columns
SELECT * INTO #ins FROM inserted
SELECT * INTO #del FROM deleted

-- Get primary key columns for full outer join
SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') 
               + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,

              INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

-- Get primary key select for insert
--SELECT @PKSelect = COALESCE(@PKSelect+'+','') 
--       + '''<' + COLUMN_NAME 
--       + '=''+convert(varchar(100),
--coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''>''' 
--       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
--               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
--       WHERE   pk.TABLE_NAME = @TableName
--       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
--       AND     c.TABLE_NAME = pk.TABLE_NAME
--       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

-- Get primary key select for insert
SELECT @PKSelect = COALESCE(@PKSelect+'+','') 
       + '''' 
       + '''+convert(nvarchar(100),
coalesce(i.' + COLUMN_NAME +',d.' + COLUMN_NAME + '))+''''' 
       FROM    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk ,
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
       WHERE   pk.TABLE_NAME = @TableName
       AND     CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND     c.TABLE_NAME = pk.TABLE_NAME
       AND     c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME



IF @PKCols IS NULL
BEGIN
       RAISERROR('no PK on table %s', 16, -1, @TableName)
       RETURN
END

SELECT         @field = 0, 
       @maxfield = MAX(ORDINAL_POSITION) 
       FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName
WHILE @field < @maxfield
BEGIN
       SELECT @field = MIN(ORDINAL_POSITION) 
               FROM INFORMATION_SCHEMA.COLUMNS 
               WHERE TABLE_NAME = @TableName 
               AND ORDINAL_POSITION > @field
       SELECT @bit = (@field - 1 )% 8 + 1
       SELECT @bit = POWER(2,@bit - 1)
       SELECT @char = ((@field - 1) / 8) + 1
       IF SUBSTRING(COLUMNS_UPDATED(),@char, 1) & @bit > 0
                                       OR @Type IN ('I','D')
       BEGIN
               SELECT @fieldname = COLUMN_NAME 
                       FROM INFORMATION_SCHEMA.COLUMNS 
                       WHERE TABLE_NAME = @TableName 
                       AND ORDINAL_POSITION = @field
               SELECT @sql = '
insert rAudit (    Type, 
               TableName, 
               PK, 
               FieldName, 
               OldValue, 
               NewValue, 
               UpdateDate, 
               UserName)
select ''' + @Type + ''',''' 
       + @TableName + ''',' + @PKSelect
       + ',''' + @fieldname + ''''
       + ',convert(nvarchar(1000),d.' + @fieldname + ')'
       + ',convert(nvarchar(1000),i.' + @fieldname + ')'
       + ',''' + @UpdateDate + ''''
       + ',''' + @UserName + ''''
       + ' from #ins i full outer join #del d'
       + @PKCols
       + ' where i.' + @fieldname + ' <> d.' + @fieldname 
       + ' or (i.' + @fieldname + ' is null and  d.'
                                + @fieldname
                                + ' is not null)' 
       + ' or (i.' + @fieldname + ' is not null and  d.' 
                                + @fieldname
                                + ' is null)' 
               EXEC (@sql)
       END
END

GO
CREATE NONCLUSTERED INDEX [IX_tblAssetUserRelations_tblADusers]
    ON [dbo].[tblAssetUserRelations]([Userdomain] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetUserRelations_tblADusers_2]
    ON [dbo].[tblAssetUserRelations]([Username] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetUserRelations_tblAssets]
    ON [dbo].[tblAssetUserRelations]([AssetID] ASC) WITH (FILLFACTOR = 90);


GO

/*
	при вставке записи проверяем:
		1. ПРОВЕРКА НЕ НУЖНА для ассета существует связанная запись в rAssetsImported 
			да - продолжаем выполнение
			нет - продолжаем выполнение, при вызове sp_HTransfer необходимые записи будут созданы
		2. проверяем что для для пользователя создан rHSclad
			да - продолжаем выполнение
			нет - завершаем аварийно с сообщением !!НЕОБХОДИМО СОЗДАТЬ ПОЛЬЗОВАТЕЛЯ В NAUMEN!!
*/
CREATE TRIGGER [dbo].[tr_Insert_tblAssetUserRelation]
    ON [dbo].[tblAssetUserRelations]
    FOR INSERT
    AS
    BEGIN
        SET NoCount ON

		declare @idrEmployee bigint = null;
		declare @idrHsclad int = null;
		declare @login nvarchar(255) = null;
		declare @cnt int = 0;
		declare @cntInserted int = 0;
		declare @cntDeleted int = 0;
		declare @AssetId int = null;


		select @login = i.Userdomain + '\' + i.Username, @AssetId = i.AssetID
		from inserted as i;

		-- проверка что на момент только один или ни одного пользователя
		-- если пользователя более 1 то завершаем с ошибкой
		select @cnt = COUNT(*)
		from tblAssetUserRelations
		where AssetID = @AssetId;

		-- подводим баланс 
		IF @cnt > 1 
			begin
				raiserror(N'не может быть больше 2х ответственных',10,1);
				rollback transaction;
				return ;
			end;
		
		select @idrHsclad = h.Id
		from rHSclad as h
		inner join rEmployee as e on h.idResponce = e.id
		inner join rHScladType as t on h.idType = t.Id
		where e.login like @login and t.TypeSclad like N'ЛК';

		-- попробовать создать склад, если не получится завершим аварийно
		IF @idrHsclad is null
			BEgin 
				raiserror(N'жопа',10,1);
				rollback transaction;
				return ;
			end;

		-- проверяю атрибуты ассета, организаци, организация владелец, инвентарный номе
		
		declare @orgUser nvarchar(255) = null;
		declare @orgOwner nvarchar(255) = null;
		declare @inventoryNum nvarchar(255) = null;
		declare @name nvarchar(255) = null;

		select @name = a.AssetName, @orgUser = ac.Custom1, @orgOwner = ac.Custom6, @inventoryNum = ac.Custom7
		from tblAssets as a
		inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
		where a.AssetID = @AssetId;

		-- проверка необходимых аргументов
		IF @name is null or @inventoryNum is null or @orgOwner is null or @orgUser is null 
			begin
				raiserror( N'Не определен один из аргументов: название, инвент №, организация владелец, организация пользователь', 12, 1);
				rollback transaction;
				return;
			end 		

		-- выполняю процедуру перемещения
		exec sp_HTransfer NULL, @idrHSclad, @AssetId;

    END
GO

/*
	если ранее ассет был одобрен в ЛК то перемещаем его в склад отстойник или на пользователя
	если ассет не был одобрен то просто удаляем связи, записи в журнале.
*/
CREATE TRIGGER [dbo].[tblAssetUserRelation_trTransfer_delete]
    ON [dbo].[tblAssetUserRelations]
    FOR DELETE
    AS
    BEGIN
        SET NoCount ON
		SET QUOTED_IDENTIFIER OFF
		SET ANSI_NULLS OFF


		declare @idrEmployee bigint = null;
		declare @idrHsclad int = null;
		declare @login nvarchar(255) = null;
		declare @cnt int = 0;
		declare @AssetId int = null;
		declare @idAsset int = null;

		select @login = d.Userdomain + '\' + d.Username, @AssetId = d.AssetID
		from deleted as d;

		-- получаем idAsset 
		select @idAsset = ai.id
		from tblAssets as a
		left join rAssetsImported as ai on a.AssetID = ai.assetId
		where a.AssetID = @AssetId;

		-- если имеется idAsset
		IF @idAsset is not null
			begin
			-- idAsset одобрен
				IF EXISTS (select *
					from rHJournal as j
					inner join rHJStatus as js on j.idStatus = js.Id
					where j.idAsset = @idAsset and js.StatusName like N'конец перемещения' )
					begin
						-- перемещаю idAsset в отстойник
						declare @idOtstoinik int = null;
						select @idOtstoinik = s.Id
						from rHSclad as s
						inner join rHScladType as t on s.idType = t.Id
						where t.TypeSclad like N'ОТСТОЙНИК';

						exec sp_HTransfer @idAsset, @idOtstoinik, @AssetId;
					end;
			end 

		-- нет idAsset нормально завершаем тригер и удаляем привязку

    END