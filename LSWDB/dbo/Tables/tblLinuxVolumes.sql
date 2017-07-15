CREATE TABLE [dbo].[tblLinuxVolumes] (
    [VolumeID]    INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT           NOT NULL,
    [Type]        NVARCHAR (20) NULL,
    [Size]        NVARCHAR (30) NULL,
    [Mounted]     NVARCHAR (20) NULL,
    [Path]        NVARCHAR (50) NULL,
    [MountPoint]  NVARCHAR (50) NULL,
    [Label]       NVARCHAR (50) NULL,
    [LastChanged] DATETIME      CONSTRAINT [DF_tblLinuxVolumes_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxVolumes] PRIMARY KEY CLUSTERED ([VolumeID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxVolumes_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxVolumes_tblAssets]
    ON [dbo].[tblLinuxVolumes]([AssetID] ASC) WITH (FILLFACTOR = 90);

