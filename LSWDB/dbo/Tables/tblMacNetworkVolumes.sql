CREATE TABLE [dbo].[tblMacNetworkVolumes] (
    [NetworkVolumeID] INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]         INT           NOT NULL,
    [Name]            NVARCHAR (50) NULL,
    [AutoMounted]     BIT           NULL,
    [MountedFrom]     NVARCHAR (50) NULL,
    [MountPoint]      NVARCHAR (50) NULL,
    [Type]            NVARCHAR (50) NULL,
    [LastChanged]     DATETIME      CONSTRAINT [DF_tblMacNetworkVolumes_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblMacNetworkVolumes] PRIMARY KEY CLUSTERED ([NetworkVolumeID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMacNetworkVolumes_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMacNetworkVolumes_tblAssets]
    ON [dbo].[tblMacNetworkVolumes]([AssetID] ASC) WITH (FILLFACTOR = 90);

