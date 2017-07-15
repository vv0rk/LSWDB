CREATE TABLE [dbo].[htblagentteam] (
    [agentid]   INT NOT NULL,
    [teamid]    INT NOT NULL,
    [webroleid] INT NOT NULL,
    CONSTRAINT [PK_htblagentteam] PRIMARY KEY CLUSTERED ([agentid] ASC, [teamid] ASC, [webroleid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblagentteam_htblagents] FOREIGN KEY ([agentid]) REFERENCES [dbo].[htblagents] ([agentid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblagentteam_htblteams] FOREIGN KEY ([teamid]) REFERENCES [dbo].[htblteams] ([teamid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblagentteam_htblwebroles] FOREIGN KEY ([webroleid]) REFERENCES [dbo].[htblwebroles] ([webroleid]) ON DELETE CASCADE
);

