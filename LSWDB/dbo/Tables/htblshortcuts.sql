CREATE TABLE [dbo].[htblshortcuts] (
    [keyid]  INT           NOT NULL,
    [effect] NVARCHAR (50) NOT NULL,
    [code]   INT           NOT NULL,
    [key]    NVARCHAR (10) NOT NULL,
    CONSTRAINT [PK_htblshortcuts] PRIMARY KEY CLUSTERED ([keyid] ASC) WITH (FILLFACTOR = 90)
);

