CREATE TABLE [dbo].[htblemailaccountsteams] (
    [teamid]    INT NOT NULL,
    [accountid] INT NOT NULL,
    CONSTRAINT [PK_htblemailaccountsteams] PRIMARY KEY CLUSTERED ([teamid] ASC, [accountid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblemailaccountsteams_htblemailaccounts] FOREIGN KEY ([accountid]) REFERENCES [dbo].[htblemailaccounts] ([accountid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblemailaccountsteams_htblteams] FOREIGN KEY ([teamid]) REFERENCES [dbo].[htblteams] ([teamid]) ON DELETE CASCADE
);

