CREATE TABLE [dbo].[htblemailtemplatesLang] (
    [templateid] INT            NOT NULL,
    [language]   INT            NOT NULL,
    [name]       NVARCHAR (250) NULL,
    [subject]    NVARCHAR (250) NULL,
    [text]       NTEXT          NULL,
    CONSTRAINT [PK_htblemailtemplatesLang] PRIMARY KEY CLUSTERED ([templateid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblemailtemplatesLang_htblemailtemplates] FOREIGN KEY ([templateid]) REFERENCES [dbo].[htblemailtemplates] ([templateid]) ON DELETE CASCADE
);

