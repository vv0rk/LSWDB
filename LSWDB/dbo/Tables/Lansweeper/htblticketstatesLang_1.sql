CREATE TABLE [dbo].[htblticketstatesLang] (
    [ticketstateid] INT           NOT NULL,
    [language]      INT           NOT NULL,
    [statename]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_htblticketstatesLang] PRIMARY KEY CLUSTERED ([ticketstateid] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblticketstatesLang_htblticketstates] FOREIGN KEY ([ticketstateid]) REFERENCES [dbo].[htblticketstates] ([ticketstateid]) ON DELETE CASCADE
);

