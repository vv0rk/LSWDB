CREATE TABLE [dbo].[tblSoundDevice] (
    [Win32_SoundDeviceid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]             INT            NOT NULL,
    [Caption]             NVARCHAR (450) NULL,
    [Manufacturer]        NVARCHAR (450) NULL,
    [Lastchanged]         DATETIME       CONSTRAINT [DF_tblSoundDevice_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblSoundDevice] PRIMARY KEY CLUSTERED ([Win32_SoundDeviceid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblSoundDevice_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblSoundDevice_tblAssets]
    ON [dbo].[tblSoundDevice]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

