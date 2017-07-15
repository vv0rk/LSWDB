CREATE TABLE [dbo].[htblsource] (
    [sourceid]    INT            NOT NULL,
    [name]        NVARCHAR (100) NOT NULL,
    [icon]        NVARCHAR (100) NOT NULL,
    [description] NVARCHAR (150) NULL,
    CONSTRAINT [PK_htblsource] PRIMARY KEY CLUSTERED ([sourceid] ASC) WITH (FILLFACTOR = 90)
);

