CREATE TABLE [dbo].[tsysPackageLogs] (
    [PackageLogID]      INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]           INT             NULL,
    [PackageID]         INT             NOT NULL,
    [Success]           BIT             CONSTRAINT [DF_tsysPackageLogs_Success] DEFAULT ((0)) NOT NULL,
    [Errorcode]         NVARCHAR (300)  NULL,
    [Destination]       NVARCHAR (300)  NULL,
    [Errormessage]      NVARCHAR (1000) NULL,
    [LastStepID]        INT             NULL,
    [Added]             DATETIME        CONSTRAINT [DF_tsysPackageLogs_Added] DEFAULT (getdate()) NOT NULL,
    [TypeID]            INT             NOT NULL,
    [ServerName]        NVARCHAR (60)   NULL,
    [Ipaddress]         NVARCHAR (50)   NULL,
    [Guid]              NVARCHAR (50)   NULL,
    [Version]           NVARCHAR (50)   NULL,
    [Executor]          NVARCHAR (100)  NULL,
    [PackageScheduleID] INT             NULL,
    [RunMode]           INT             NULL,
    PRIMARY KEY CLUSTERED ([PackageLogID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsyspackagelogs_tsysASServers] FOREIGN KEY ([ServerName]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tsysPackageLogs_tsysPackages] FOREIGN KEY ([TypeID]) REFERENCES [dbo].[tsysPackageLogType] ([TypeID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageLogs_tsysPackageLogType]
    ON [dbo].[tsysPackageLogs]([TypeID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysPackageLogs_tsysASServers]
    ON [dbo].[tsysPackageLogs]([ServerName] ASC) WITH (FILLFACTOR = 90);

