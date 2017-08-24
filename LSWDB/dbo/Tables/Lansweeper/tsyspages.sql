CREATE TABLE [dbo].[tsyspages] (
    [PageID]    INT            NOT NULL,
    [Pagename]  NVARCHAR (150) NOT NULL,
    [Sortorder] NUMERIC (18)   NULL,
    [image]     VARCHAR (100)  NULL,
    CONSTRAINT [PK_tsyspages] PRIMARY KEY CLUSTERED ([PageID] ASC) WITH (FILLFACTOR = 90)
);

