CREATE TABLE [dbo].[tsysUserSchedule] (
    [ScheduleID]    INT             IDENTITY (1, 1) NOT NULL,
    [Servername]    NVARCHAR (60)   NOT NULL,
    [Scantarget]    NVARCHAR (1024) NOT NULL,
    [Netbiosdomain] NVARCHAR (150)  NOT NULL,
    [Enabled]       BIT             NOT NULL,
    [ScanNow]       BIT             CONSTRAINT [DF_tsysUserschedule_ScanNow] DEFAULT ((0)) NOT NULL,
    [Day1]          BIT             CONSTRAINT [DF_tsysUserschedule_Day1] DEFAULT ((0)) NOT NULL,
    [Day2]          BIT             CONSTRAINT [DF_tsysUserschedule_Day2] DEFAULT ((0)) NOT NULL,
    [Day3]          BIT             CONSTRAINT [DF_tsysUserschedule_Day3] DEFAULT ((0)) NOT NULL,
    [Day4]          BIT             CONSTRAINT [DF_tsysUserschedule_Day4] DEFAULT ((0)) NOT NULL,
    [Day5]          BIT             CONSTRAINT [DF_tsysUserschedule_Day5] DEFAULT ((0)) NOT NULL,
    [Day6]          BIT             CONSTRAINT [DF_tsysUserschedule_Day6] DEFAULT ((0)) NOT NULL,
    [Day7]          BIT             CONSTRAINT [DF_tsysUserschedule_Day7] DEFAULT ((0)) NOT NULL,
    [Day1time]      DATETIME        CONSTRAINT [DF_tsysUserschedule_Day1time] DEFAULT ('00:00:00') NOT NULL,
    [Day2time]      DATETIME        CONSTRAINT [DF_tsysUserschedule_Day2time] DEFAULT ('00:00:00') NOT NULL,
    [Day3time]      DATETIME        CONSTRAINT [DF_tsysUserschedule_Day3time] DEFAULT ('00:00:00') NOT NULL,
    [Day4time]      DATETIME        CONSTRAINT [DF_tsysUserschedule_Day4time] DEFAULT ('00:00:00') NOT NULL,
    [Day5time]      DATETIME        CONSTRAINT [DF_tsysUserschedule_Day5time] DEFAULT ('00:00:00') NOT NULL,
    [Day6time]      DATETIME        CONSTRAINT [DF_tsysUserschedule_Day6time] DEFAULT ('00:00:00') NOT NULL,
    [Day7time]      DATETIME        CONSTRAINT [DF_tsysUserschedule_Day7time] DEFAULT ('00:00:00') NOT NULL,
    [LastScanned]   DATETIME        NULL,
    [Description]   NVARCHAR (1000) NULL,
    [ErrorText]     NVARCHAR (250)  NULL,
    CONSTRAINT [PK_tsysUserSchedule] PRIMARY KEY CLUSTERED ([ScheduleID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysUserSchedule_tsysASServers] FOREIGN KEY ([Servername]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysUserSchedule_tsysASServers]
    ON [dbo].[tsysUserSchedule]([Servername] ASC) WITH (FILLFACTOR = 90);

