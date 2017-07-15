CREATE TABLE [dbo].[tblVmwareInfo] (
    [VmwareID]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT            NOT NULL,
    [Version]       NVARCHAR (400) NULL,
    [BiosVersion]   NVARCHAR (255) NULL,
    [BiosDate]      DATETIME       NULL,
    [lastchanged]   DATETIME       CONSTRAINT [DF_tblVmwareInfo_lastchanged] DEFAULT (getdate()) NOT NULL,
    [numCpuCores]   INT            NULL,
    [numCpuPkgs]    INT            NULL,
    [numCpuThreads] INT            NULL,
    CONSTRAINT [PK_tblVmwareInfo] PRIMARY KEY CLUSTERED ([VmwareID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblVmwareInfo_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblVmwareInfo_tblAssets]
    ON [dbo].[tblVmwareInfo]([AssetID] ASC) WITH (FILLFACTOR = 90);

