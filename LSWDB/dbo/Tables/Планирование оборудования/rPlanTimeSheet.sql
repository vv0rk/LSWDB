/*
	в этой таблице планируется перемещение ассетов во времени, сценарии ...
	все изменения фиксируются в таблице rAudit
	все сценарии разыгрываются для устройства AssetId
	Если устройство вновь устанавливаемое, то AssetId is NULL

	События оказывающие влияние на флаг isAttention
	Кто пытается заменить это устройство и установил srcAssetId

	Устройство участвует в планировании расходных материалов и комплектующих только когда
		находится в статусе Active или Non-Active во всех остальных статусах в планировании не участвует.

	Логика работы устанавливается в хранимых процедурах.
	Устройство устанавливается вместо другого:
	Устройство заменяется на новое, требуется закупка	
*/
CREATE TABLE [dbo].[rPlanTimeSheet]
(
	[Id] INT NOT NULL PRIMARY KEY identity(1,1), 
    [AssetId] INT NULL, -- устройство которое представлено этим таймшитом
	[idState] INT NOT NULL default 9, -- статус устройства, по умолчанию устройство получает статус 9. 
    [tgtId] INT NULL, -- устройство, вместо которого планируется установить этот девайс
	[srcId] INT NULL, -- устройство, которое планируется установить вместо этого девайса
	[idDeviceClass] int null, -- позиция из справочника
	-- дата планируемого перемещения или текущего изменения статуса
	[ExDate] datetime not null,
	-- определяем владельца планируемого устройства, изначально данные берутся из Lansweeper
	-- завершение перемещение фиксируется данными из личной карточки - ЛК основной источник информации
	Org NVARCHAR(50) null,
	Filial NVARCHAR(50) null,
	Gorod nvarchar(255) null,
	Address nvarchar(255) null, 
	Office nvarchar(255) null,
	idEmployee bigint null,
	idOU bigint null,
	-- Флаг фиксирующий что необходимо вмешательство оператора.
	-- Флаг взводится если на устройство оказывается влияние другое устройство 
	-- заполняется srcAssetId и взводится isAttention в 1
	isAttention bit not null default 0, 
	-- флаг подтверждающий что планируемое перемещение было завершено
	-- флаг взводится при подтверждении завершения оператором
	-- в момент одобрения личной карточки, в этот момент применяются все перемещения которые производились до
	-- времени одобрения личной карточки
	isFinished bit not null default 0,
	/* Флаг взводится когда перемещение одобрено
	*/
	isApproved bit not null default 0,

	-- двигаться могут только устройства присутствующие в Lansweeper или только что закупленные
	CONSTRAINT [FK_rPlanTimeSheet_tblAssets] FOREIGN KEY (AssetId) REFERENCES tblAssets(AssetId) on delete cascade,
	CONSTRAINT [FK_rPlanTimeSheet_tblState] FOREIGN KEY (idState) REFERENCES tblState(State)
)

go

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,27/05/2017,>
/* Description:	<Универсальный триггер для записи логов по изменению данных>
	https://stackoverflow.com/questions/19737723/log-record-changes-in-sql-server-in-an-audit-table
*/
-- =============================================
CREATE TRIGGER TR_rPlanTimeSheetAudit ON rPlanTimeSheet FOR UPDATE, insert, delete
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
SELECT @TableName = 'rPlanTimeSheet'

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