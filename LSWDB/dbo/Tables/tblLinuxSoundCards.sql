CREATE TABLE [dbo].[tblLinuxSoundCards] (
    [SoundID]     INT         IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT         NOT NULL,
    [Card]        NCHAR (300) NULL,
    [Vendor]      NCHAR (50)  NULL,
    [Parent]      NCHAR (50)  NULL,
    [LastChanged] DATETIME    CONSTRAINT [DF_tblLinuxSoundCards_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxSoundCards] PRIMARY KEY CLUSTERED ([SoundID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxSoundCards_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxSoundCards_tblAssets]
    ON [dbo].[tblLinuxSoundCards]([AssetID] ASC) WITH (FILLFACTOR = 90);

