CREATE TABLE [dbo].[tblSharesUni] (
    [ShareUniqueID] INT             IDENTITY (1, 1) NOT NULL,
    [Caption]       NVARCHAR (450)  NULL,
    [Name]          NVARCHAR (450)  NULL,
    [Path]          NVARCHAR (1000) NULL,
    [Type]          NUMERIC (18)    NULL,
    [hash]          VARCHAR (40)    NOT NULL,
    CONSTRAINT [PK_tblSharesUni] PRIMARY KEY CLUSTERED ([ShareUniqueID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblSharesUni]
    ON [dbo].[tblSharesUni]([hash] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

