CREATE TABLE [dbo].[htblprioritiesLang] (
    [priority] INT           NOT NULL,
    [language] INT           NOT NULL,
    [name]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_htblprioritiesLang] PRIMARY KEY CLUSTERED ([priority] ASC, [language] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblprioritiesLang_htblpriorities] FOREIGN KEY ([priority]) REFERENCES [dbo].[htblpriorities] ([priority]) ON DELETE CASCADE
);

