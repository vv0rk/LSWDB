CREATE TABLE [dbo].[tsysPackageExecution] (
    [ExecutionID]       INT           IDENTITY (1, 1) NOT NULL,
    [PackageScheduleID] INT           NOT NULL,
    [ScanServer]        NVARCHAR (60) NOT NULL,
    [LastRun]           DATETIME      CONSTRAINT [DF_tsysPackageExecution_LastRun] DEFAULT ('1900-01-01 00:00:00.000') NOT NULL,
    [Executed]          BIT           CONSTRAINT [DF_tsysPackageExecution_Executed] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_tsysPackageExecution] PRIMARY KEY CLUSTERED ([ExecutionID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysPackageExecution_tsysASServers] FOREIGN KEY ([ScanServer]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tsysPackageExecution_tsysPackageSchedule] FOREIGN KEY ([PackageScheduleID]) REFERENCES [dbo].[tsysPackageSchedule] ([PackageScheduleID]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageExecution_tsysASServers]
    ON [dbo].[tsysPackageExecution]([ScanServer] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageExecution_tsysPackageSchedule]
    ON [dbo].[tsysPackageExecution]([PackageScheduleID] ASC) WITH (FILLFACTOR = 90);

