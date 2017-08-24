CREATE TABLE [dbo].[tblUSBControllerHist] (
    [Trackercode]       INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]           INT            NOT NULL,
    [Caption]           NVARCHAR (450) NULL,
    [Manufacturer]      NVARCHAR (450) NULL,
    [ProtocolSupported] NUMERIC (18)   NULL,
    [Lastchanged]       DATETIME       CONSTRAINT [DF_tblUSBControllerhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]            NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblUSBControllerhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblUSBControllerhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblUSBControllerhist_tblAssets]
    ON [dbo].[tblUSBControllerHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

