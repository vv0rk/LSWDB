CREATE TABLE [dbo].[htblreportsLang] (
    [reportid] INT            NOT NULL,
    [language] INT            NOT NULL,
    [title]    NVARCHAR (200) NULL,
    CONSTRAINT [PK_htblreportsLang] PRIMARY KEY CLUSTERED ([reportid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([reportid]) REFERENCES [dbo].[htblreports] ([reportid]) ON DELETE CASCADE
);

