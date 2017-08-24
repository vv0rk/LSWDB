CREATE TABLE [dbo].[tsysRemoteDatabases] (
    [RemoteDatabaseID] INT            IDENTITY (1, 1) NOT NULL,
    [IP/DNS]           NVARCHAR (150) NOT NULL,
    [Port]             INT            NOT NULL,
    [Password]         NVARCHAR (250) NOT NULL,
    [RunNow]           BIT            DEFAULT ((0)) NOT NULL,
    [Enabled]          BIT            DEFAULT ((1)) NOT NULL,
    [Description]      NVARCHAR (250) NULL,
    [ScheduleID]       INT            NOT NULL,
    [Lastscan]         DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([RemoteDatabaseID] ASC) WITH (FILLFACTOR = 90)
);

