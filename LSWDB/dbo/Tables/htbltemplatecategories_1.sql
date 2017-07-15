CREATE TABLE [dbo].[htbltemplatecategories] (
    [categoryid] INT            IDENTITY (1, 1) NOT NULL,
    [name]       NVARCHAR (100) NOT NULL,
    CONSTRAINT [pk_htbltemplatecategories] PRIMARY KEY CLUSTERED ([categoryid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [AK_name] UNIQUE NONCLUSTERED ([name] ASC) WITH (FILLFACTOR = 90)
);

