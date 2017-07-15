CREATE TABLE [dbo].[htbltickettypeteams] (
    [teamid]       INT NOT NULL,
    [tickettypeid] INT NOT NULL,
    CONSTRAINT [PK_htbltickettypeteams] PRIMARY KEY CLUSTERED ([teamid] ASC, [tickettypeid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htbltickettypeteams_htblteams] FOREIGN KEY ([teamid]) REFERENCES [dbo].[htblteams] ([teamid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htbltickettypeteams_htbltickettypes] FOREIGN KEY ([tickettypeid]) REFERENCES [dbo].[htbltickettypes] ([tickettypeid]) ON DELETE CASCADE
);

