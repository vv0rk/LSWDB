CREATE TABLE [dbo].[tblVmwareGuest] (
    [GuestID]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [AssetID]            INT            NOT NULL,
    [Name]               NVARCHAR (255) NOT NULL,
    [Memory]             NUMERIC (18)   NULL,
    [IsRunning]          VARCHAR (50)   NULL,
    [lastchanged]        DATETIME       CONSTRAINT [DF_tblVmwareGuest_lastchanged] DEFAULT (getdate()) NULL,
    [ToolsRunningStatus] TINYINT        NULL,
    [ToolsVersion]       NVARCHAR (50)  NULL,
    [ToolsVersionStatus] TINYINT        NULL,
    [ToolsStatus]        TINYINT        NULL,
    [CpuCount]           INT            NULL,
    CONSTRAINT [PK_tblVmwareGuest] PRIMARY KEY CLUSTERED ([GuestID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblVmwareGuest_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IX_tblVmwareGuest]
    ON [dbo].[tblVmwareGuest]([Name] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblVmwareGuest_tblAssets]
    ON [dbo].[tblVmwareGuest]([AssetID] ASC) WITH (FILLFACTOR = 90);

