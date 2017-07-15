CREATE TABLE [dbo].[htblspecialrulestaskagents] (
    [ruletaskagentid] INT IDENTITY (1, 1) NOT NULL,
    [ruletaskid]      INT NOT NULL,
    [agentid]         INT NOT NULL,
    [agentteamid]     INT NOT NULL,
    CONSTRAINT [PK_htblspecialrulestaskagents] PRIMARY KEY CLUSTERED ([ruletaskagentid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblspecialrulestaskagents_htblagents] FOREIGN KEY ([agentid]) REFERENCES [dbo].[htblagents] ([agentid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_htblspecialrulestaskagents_htblspecialrulestasks] FOREIGN KEY ([ruletaskid]) REFERENCES [dbo].[htblspecialrulestasks] ([taskid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_htblspecialrulestaskagents_htblteams] FOREIGN KEY ([agentteamid]) REFERENCES [dbo].[htblteams] ([teamid]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblspecialrulestaskagents_htblspecialrulestasks]
    ON [dbo].[htblspecialrulestaskagents]([ruletaskid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblspecialrulestaskagents_htblagents]
    ON [dbo].[htblspecialrulestaskagents]([agentid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblspecialrulestaskagents_htblteams]
    ON [dbo].[htblspecialrulestaskagents]([agentteamid] ASC) WITH (FILLFACTOR = 90);

