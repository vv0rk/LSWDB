CREATE TABLE [dbo].[htblshortcutsLang] (
    [keyid]    INT           NOT NULL,
    [language] INT           NOT NULL,
    [effect]   NVARCHAR (50) NULL,
    CONSTRAINT [PK_htblshortcutsLang] PRIMARY KEY CLUSTERED ([keyid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([keyid]) REFERENCES [dbo].[htblshortcuts] ([keyid]) ON DELETE CASCADE
);

