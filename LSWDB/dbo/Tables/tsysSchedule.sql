CREATE TABLE [dbo].[tsysSchedule] (
    [ScheduleID]    INT           IDENTITY (1, 1) NOT NULL,
    [ScheduleName]  NVARCHAR (50) NOT NULL,
    [StartTime]     DATETIME      NOT NULL,
    [Interval]      BIGINT        NULL,
    [WeekDays]      TINYINT       CONSTRAINT [DF__tsysSched__WeekD__28CDE297] DEFAULT ((0)) NULL,
    [MonthDays]     INT           CONSTRAINT [DF__tsysSched__Month__29C206D0] DEFAULT ((0)) NULL,
    [ExecutionMode] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([ScheduleID] ASC) WITH (FILLFACTOR = 90)
);

