CREATE TABLE [dbo].[htblemailtemplatesticketstates] (
    [templateid]    INT NOT NULL,
    [ticketstateid] INT NOT NULL,
    CONSTRAINT [PK_] PRIMARY KEY CLUSTERED ([templateid] ASC, [ticketstateid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([templateid]) REFERENCES [dbo].[htblemailtemplates] ([templateid]) ON DELETE CASCADE,
    FOREIGN KEY ([ticketstateid]) REFERENCES [dbo].[htblticketstates] ([ticketstateid]) ON DELETE CASCADE
);

