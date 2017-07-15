CREATE TABLE [dbo].[htblticketteam] (
    [ticketid] INT NOT NULL,
    [teamid]   INT NOT NULL,
    CONSTRAINT [PK_htblticketteam] PRIMARY KEY CLUSTERED ([ticketid] ASC, [teamid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblticketteam_htblteams] FOREIGN KEY ([teamid]) REFERENCES [dbo].[htblteams] ([teamid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblticketteam_htblticket] FOREIGN KEY ([ticketid]) REFERENCES [dbo].[htblticket] ([ticketid]) ON DELETE CASCADE
);

