CREATE TABLE [dbo].[htblemailtemplatespriorities] (
    [templateid] INT NOT NULL,
    [priority]   INT NOT NULL,
    CONSTRAINT [PK_htblemailtemplatespriorities] PRIMARY KEY CLUSTERED ([templateid] ASC, [priority] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblemailtemplatespriorities_htblemailtemplates] FOREIGN KEY ([templateid]) REFERENCES [dbo].[htblemailtemplates] ([templateid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblemailtemplatespriorities_htblpriorities] FOREIGN KEY ([priority]) REFERENCES [dbo].[htblpriorities] ([priority]) ON DELETE CASCADE
);

