CREATE TABLE [dbo].[tblEncryptableVolume] (
    [Win32_EncryptableVolumeId] INT           IDENTITY (1, 1) NOT NULL,
    [AssetId]                   INT           NOT NULL,
    [DriveLetter]               NVARCHAR (50) NULL,
    [ProtectionStatus]          INT           NULL,
    [LastChanged]               DATETIME      CONSTRAINT [DF_tblEncryptableVolume_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblEncryptableVolume] PRIMARY KEY CLUSTERED ([Win32_EncryptableVolumeId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblEncryptableVolume_tblAssets] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblEncryptableVolume_tblAssets]
    ON [dbo].[tblEncryptableVolume]([AssetId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

