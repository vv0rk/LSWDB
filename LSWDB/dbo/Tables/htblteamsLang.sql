CREATE TABLE [dbo].[htblteamsLang] (
    [teamid]   INT            NOT NULL,
    [language] INT            NOT NULL,
    [teamname] NVARCHAR (100) NULL,
    CONSTRAINT [PK_htblteamsLang] PRIMARY KEY CLUSTERED ([teamid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblteamsLang_htblteams] FOREIGN KEY ([teamid]) REFERENCES [dbo].[htblteams] ([teamid]) ON DELETE CASCADE
);

