CREATE TABLE [dbo].[htblspecialrules] (
    [ruleid]          INT             IDENTITY (1, 1) NOT NULL,
    [name]            NVARCHAR (100)  NOT NULL,
    [description]     NVARCHAR (4000) NOT NULL,
    [sortorder]       INT             DEFAULT ((100)) NULL,
    [enabled]         BIT             DEFAULT ((0)) NULL,
    [stopdispatching] BIT             DEFAULT ((0)) NULL,
    CONSTRAINT [PK_htblspecialrules] PRIMARY KEY CLUSTERED ([ruleid] ASC) WITH (FILLFACTOR = 90)
);

