CREATE TABLE [dbo].[htblserviceactions] (
    [actionid]     INT           NOT NULL,
    [action]       NVARCHAR (50) NULL,
    [compare]      NVARCHAR (50) NULL,
    [operator]     NVARCHAR (50) NULL,
    [comparevalue] NVARCHAR (50) NULL,
    CONSTRAINT [PK_htblserviceactions] PRIMARY KEY CLUSTERED ([actionid] ASC) WITH (FILLFACTOR = 90)
);

