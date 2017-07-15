CREATE TABLE [dbo].[htblpriorities] (
    [priority]  INT           NOT NULL,
    [name]      NVARCHAR (50) NULL,
    [color]     NVARCHAR (10) NULL,
    [sortorder] INT           DEFAULT ((1)) NULL,
    CONSTRAINT [PK_htblpriorities] PRIMARY KEY CLUSTERED ([priority] ASC) WITH (FILLFACTOR = 90)
);

