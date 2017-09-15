CREATE TABLE [dbo].[rMaterialRashod] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [AssetId]          INT            NOT NULL,
	[idMaterialOriginal] INT		null,
    [IdMaterialAnalog] INT            NULL,
    [PrintedPages]     INT            NULL,
    [Date]             DATETIME       DEFAULT (getdate()) NULL,
    [Number]           INT            DEFAULT ((1)) NOT NULL,
    [IdSclad]          INT            DEFAULT ((1)) NOT NULL,
    [Id1CSprav]        INT            NULL,
    [Comment]          NVARCHAR (100) NULL,
    [ResourceFact]     INT            NULL,
    [Username] NVARCHAR(255) NULL, 
    [isRemoved] BIT NOT NULL default 0, 
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rMaterialRashod_r1CSprav_Id1CSprav] FOREIGN KEY ([Id1CSprav]) REFERENCES [dbo].[r1CSprav] ([Id]), 
    CONSTRAINT [FK_rMaterialRashod_rMaterialOriginal] FOREIGN KEY (idMaterialOriginal) REFERENCES rMaterialOriginal(id)
);


GO

CREATE trigger [dbo].[trigger_rMaterialRashodAll]
on [dbo].[rMaterialRashod] after insert, update, delete
as
begin
	return
	-- set nocount on added to prevent extra result sets from
	-- interfering with select statements.
	set nocount on;

	with C as (
	select 
		mr.ResourceFact as ResourceFact_tgt
		, p.ResourceFact as ResourceFact_src
		, p.TonerNumber
	from dbo.rMaterialRashod as mr
	inner join (
		select 
			ROW_NUMBER() over( partition by mr.AssetId order by mr.Date) as Number
			, mr.Id as Id
			, mr.AssetId as AssetId
			, ac.Model as 'ModelLS'
			, md.Model as 'ModelSprav'
			, mr.Date
			, ma.PartNumber
			, ma.Resource
			, mr.PrintedPages as res
			, lead(mr.PrintedPages) over( partition by mr.AssetId order by mr.Date) as prev
			, mr.Number as 'TonerNumber'
			, lead(mr.PrintedPages) over( partition by mr.AssetId order by mr.Date) - mr.PrintedPages as ResourceFact
		from dbo.rMaterialRashod as mr
		left join dbo.tblAssetCustom as ac on mr.AssetId = ac.AssetID
		left join dbo.rModelLink as ml on ac.Model = ml.ModelAsset
		left join dbo.rModelDevice as md on ml.ModelSprav = md.Model
		inner join dbo.rMaterialAnalog as ma on mr.IdMaterialAnalog = ma.Id
	) as p on mr.Id = p.Id
) update C set
	ResourceFact_tgt = ResourceFact_src;

end
GO

GO
GRANT ALTER
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rMaterialRashod] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialRashod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialRashod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialRashod] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialRashod] TO [IE\UIT_USERS_VR]
    AS [dbo];




GO

CREATE INDEX [IX_rMaterialRashod_AssetId] ON [dbo].[rMaterialRashod] (AssetId)

GO

CREATE TRIGGER [dbo].[Trigger_rMaterialRashod] ON [dbo].[rMaterialRashod] FOR DELETE, INSERT, UPDATE
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
SELECT @TableName = 'rMaterialRashod'

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