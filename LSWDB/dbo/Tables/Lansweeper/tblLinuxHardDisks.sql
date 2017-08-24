CREATE TABLE [dbo].[tblLinuxHardDisks] (
    [HardDiskID]  INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Filesystem]  NVARCHAR (400) NULL,
    [Size]        NVARCHAR (30)  NULL,
    [Used]        NVARCHAR (30)  NULL,
    [Available]   NVARCHAR (30)  NULL,
    [Percentage]  NVARCHAR (10)  NULL,
    [MountedOn]   NVARCHAR (300) NULL,
    [LastChanged] DATETIME       CONSTRAINT [DF_tblLinuxHardDisks_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxHardDisks] PRIMARY KEY CLUSTERED ([HardDiskID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxHardDisks_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxHardDisks_tblAssets]
    ON [dbo].[tblLinuxHardDisks]([AssetID] ASC) WITH (FILLFACTOR = 90);

