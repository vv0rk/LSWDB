CREATE TABLE [dbo].[tsysAlertSchedule] (
    [AlertScheduleId] INT            IDENTITY (1, 1) NOT NULL,
    [AlertId]         NVARCHAR (150) NOT NULL,
    [ScheduleId]      INT            NOT NULL,
    [LastRun]         DATETIME       NULL,
    CONSTRAINT [PK_tsysAlertSchedule] PRIMARY KEY CLUSTERED ([AlertScheduleId] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysAlertSchedule_tsysSchedule] FOREIGN KEY ([ScheduleId]) REFERENCES [dbo].[tsysSchedule] ([ScheduleID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysAlertSchedule_tsysSchedule]
    ON [dbo].[tsysAlertSchedule]([ScheduleId] ASC) WITH (FILLFACTOR = 90);

