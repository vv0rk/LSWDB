CREATE TABLE [dbo].[rHJournal] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
	-- ассет который двигаем.
    [idAsset]      INT            NOT NULL,
	-- склад из которого перемещаем ассет
    [idScl1]       INT            NULL,
	-- склад на который падает ассет
    [idScl2]       INT            NULL,
	-- ссылка не предыдущую запись
    [idJprev]      INT            NULL,
    [idStatus]     INT            NOT NULL,
    [userCreate]   NVARCHAR (255) NULL,
    [dateCreate]   DATETIME       NULL,
    [userApprove]  NVARCHAR (255) NULL,
    [dateApprove]  DATETIME       NULL,
    [Comment]      NVARCHAR (255) NULL,
    [idSclStatus1] INT            NULL,
    [idSclStatus2] INT            NULL,
	-- сохраняем идентификаторы ЛК
	[idLK1]			BIGINT		NULL,
	[idLK2]			BIGINT		NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_rHJournal_rAssetsImported_idAsset_Id] FOREIGN KEY ([idAsset]) REFERENCES [dbo].[rAssetsImported] ([id]),
    CONSTRAINT [FK_rHJournal_rHJournal_idJPrev_Id] FOREIGN KEY ([idJprev]) REFERENCES [dbo].[rHJournal] ([Id]),
    CONSTRAINT [FK_rHJournal_rHJStatus_idStatus_id] FOREIGN KEY ([idStatus]) REFERENCES [dbo].[rHJStatus] ([Id]),
    CONSTRAINT [FK_rHJournal_rHSclad_idScl1_Id] FOREIGN KEY ([idScl1]) REFERENCES [dbo].[rHSclad] ([Id]),
    CONSTRAINT [FK_rHJournal_rHSclad_idScl2_Id] FOREIGN KEY ([idScl2]) REFERENCES [dbo].[rHSclad] ([Id]),
    CONSTRAINT [FK_rHJournal_rHScladStatus_idSclStatus1_id] FOREIGN KEY ([idSclStatus1]) REFERENCES [dbo].[rHScladStatus] ([Id]),
    CONSTRAINT [FK_rHJournal_rHScladStatus_idSclStatus2_id] FOREIGN KEY ([idSclStatus2]) REFERENCES [dbo].[rHScladStatus] ([Id])
);

go

CREATE TRIGGER [dbo].[Trigger_rHJournal_Audit]
    ON [dbo].[rHJournal]
    FOR DELETE, INSERT, UPDATE
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
SELECT @TableName = 'rHJournal'

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