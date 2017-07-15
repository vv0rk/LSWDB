CREATE TABLE [dbo].[htblnewsLang] (
    [newsid]      INT            NOT NULL,
    [language]    INT            NOT NULL,
    [description] NVARCHAR (100) NULL,
    [text]        NTEXT          NULL,
    CONSTRAINT [PK_htblnewsLang] PRIMARY KEY CLUSTERED ([newsid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblnewsLang_htblnews] FOREIGN KEY ([newsid]) REFERENCES [dbo].[htblnews] ([newsid]) ON DELETE CASCADE
);

