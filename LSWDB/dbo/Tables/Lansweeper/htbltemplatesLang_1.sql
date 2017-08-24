CREATE TABLE [dbo].[htbltemplatesLang] (
    [templateid] INT            NOT NULL,
    [language]   INT            NOT NULL,
    [name]       NVARCHAR (100) NULL,
    [text]       NTEXT          NULL,
    CONSTRAINT [PK_htbltemplatesLang] PRIMARY KEY CLUSTERED ([templateid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htbltemplatesLang_htbltemplates] FOREIGN KEY ([templateid]) REFERENCES [dbo].[htbltemplates] ([templateid]) ON DELETE CASCADE
);

