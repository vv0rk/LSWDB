CREATE TABLE [dbo].[htblknowledgebasecategories] (
    [categoryid] INT           IDENTITY (1, 1) NOT NULL,
    [name]       NVARCHAR (50) NOT NULL,
    [sortorder]  INT           NOT NULL,
    [color]      NCHAR (10)    NULL,
    [useraccess] BIT           NULL,
    CONSTRAINT [PK_htblknowledgebasecategories] PRIMARY KEY CLUSTERED ([categoryid] ASC) WITH (FILLFACTOR = 90)
);

