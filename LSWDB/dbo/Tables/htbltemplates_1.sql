CREATE TABLE [dbo].[htbltemplates] (
    [templateid] INT            IDENTITY (1, 1) NOT NULL,
    [name]       NVARCHAR (100) DEFAULT ('New template') NULL,
    [text]       NTEXT          NULL,
    [categoryid] INT            NULL,
    CONSTRAINT [PK_htbltemplates] PRIMARY KEY CLUSTERED ([templateid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htbltemplates_htbltemplatecategories] FOREIGN KEY ([categoryid]) REFERENCES [dbo].[htbltemplatecategories] ([categoryid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htbltemplates_htbltemplatecategories]
    ON [dbo].[htbltemplates]([categoryid] ASC) WITH (FILLFACTOR = 90);

