CREATE TABLE [dbo].[rHSclad] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    -- тип склада:
    -- ЛК - личная карточка, формируется для сотрудника. Сотрудник отвечает за оборудование.
    -- ЦС - центральный склад, формируестя для кладовой. Назначается ответственный за кладовую
    -- АК - Аппаратная комната. Формируется для установки работающего оборудования. Серверная, кроссовая, помещение аудиторов ... 
    [idType]     INT            NOT NULL,
    -- Общепринятое название (если имеется)
	[Name]		 NVARCHAR(255)  NULL,
    -- ответственный за оборудование склада. 
    -- ЛК - это сотрудник
    -- ЦС - МОЛ назначенный со стороны УСЦ
    -- АК - сотрудник ответственный за сохранность оборудования в этой комнате.
    [idResponce] BIGINT         NULL,
    -- login для создания склада в ручную при отсутствии пользователя в наумене
    [login_resp] nvarchar(100) null,
    [fio_resp] nvarchar(255) default (N'') not null,
	-- статус склада
    [idStatus]   INT            DEFAULT ((0)) NOT NULL,
    [idCompany]  INT            NULL,
	[idFilial]	 INT			NULL,
    [Gorod]      NVARCHAR (255) NULL,
    [Adress]     NVARCHAR (255) NULL,
    [Office]     NVARCHAR (255) NULL,
    [idLK] BIGINT NULL, 
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_rHSclad_rCompany_idCompany_id] FOREIGN KEY ([idCompany]) REFERENCES [dbo].[rCompany$] ([id]),
    CONSTRAINT [FK_rHSclad_rHScladStatus_idStatus_id] FOREIGN KEY ([idStatus]) REFERENCES [dbo].[rHScladStatus] ([Id]),
    CONSTRAINT [FK_rHSclad_rHScladType_idType_Id] FOREIGN KEY ([idType]) REFERENCES [dbo].[rHScladType] ([Id]), 
    CONSTRAINT [FK_rHSclad_rHScladIdHistory] FOREIGN KEY ([idLK]) REFERENCES [rHScladIdHistory]([Id])
);


GO

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,27/05/2017,>
/* Description:	<Универсальный триггер для записи логов по изменению данных>
	https://stackoverflow.com/questions/19737723/log-record-changes-in-sql-server-in-an-audit-table
*/
-- =============================================
CREATE TRIGGER TR_rHSclad ON rHSclad FOR UPDATE, insert, delete
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
SELECT @TableName = 'rHSclad'

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

CREATE UNIQUE NONCLUSTERED INDEX [IX_rHSclad_login_resp] ON [dbo].[rHSclad] (idType, Name, [login_resp]) WHERE ([login_resp] is not null and idType <> 0 and Name is not null);



GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_rHSclad_idLK] ON [dbo].[rHSclad] ([idLK]) WHERE idLK is not NULL;
