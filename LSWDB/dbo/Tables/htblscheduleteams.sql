CREATE TABLE [dbo].[htblscheduleteams] (
    [ScheduleTeamID] INT IDENTITY (1, 1) NOT NULL,
    [ScheduleID]     INT NOT NULL,
    [TeamID]         INT NOT NULL,
    [EditAllowed]    BIT CONSTRAINT [DF_htblscheduleteams_EditAllowed] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_htblscheduleteams] PRIMARY KEY CLUSTERED ([ScheduleTeamID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblscheduleteams_htblschedule] FOREIGN KEY ([ScheduleID]) REFERENCES [dbo].[htblschedule] ([scheduleid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_htblscheduleteams_htblteams] FOREIGN KEY ([TeamID]) REFERENCES [dbo].[htblteams] ([teamid]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblscheduleteams_htblteams]
    ON [dbo].[htblscheduleteams]([TeamID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblscheduleteams_htblschedule]
    ON [dbo].[htblscheduleteams]([ScheduleID] ASC) WITH (FILLFACTOR = 90);

