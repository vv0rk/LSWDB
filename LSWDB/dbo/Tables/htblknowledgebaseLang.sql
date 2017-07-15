CREATE TABLE [dbo].[htblknowledgebaseLang] (
    [kbid]     INT            NOT NULL,
    [language] INT            NOT NULL,
    [name]     NVARCHAR (100) NULL,
    [message]  NTEXT          NULL,
    CONSTRAINT [PK_htblknowledgebaseLang] PRIMARY KEY CLUSTERED ([kbid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblknowledgebaseLang_htblknowledgebase] FOREIGN KEY ([kbid]) REFERENCES [dbo].[htblknowledgebase] ([kbid]) ON DELETE CASCADE
);

