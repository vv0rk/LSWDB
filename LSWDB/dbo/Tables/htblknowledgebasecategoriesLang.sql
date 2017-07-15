CREATE TABLE [dbo].[htblknowledgebasecategoriesLang] (
    [categoryid] INT            NOT NULL,
    [language]   INT            NOT NULL,
    [name]       NVARCHAR (100) NULL,
    CONSTRAINT [PK_htblknowledgebasecategoriesLang] PRIMARY KEY CLUSTERED ([categoryid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblknowledgebasecategoriesLang_htblknowledgebasecategories] FOREIGN KEY ([categoryid]) REFERENCES [dbo].[htblknowledgebasecategories] ([categoryid]) ON DELETE CASCADE
);

