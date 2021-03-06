﻿CREATE TABLE [dbo].[tblSoundDeviceHist] (
    [Trackercode]  INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]      INT            NOT NULL,
    [Caption]      NVARCHAR (450) NULL,
    [Manufacturer] NVARCHAR (450) NULL,
    [Lastchanged]  DATETIME       CONSTRAINT [DF_tblSoundDevicehist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]       NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblSoundDevicehist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblSoundDevicehist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblSoundDevicehist_tblAssets]
    ON [dbo].[tblSoundDeviceHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

