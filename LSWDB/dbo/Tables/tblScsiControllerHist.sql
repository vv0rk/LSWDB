CREATE TABLE [dbo].[tblScsiControllerHist] (
    [Trackercode]       INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]           INT            NOT NULL,
    [Availability]      NUMERIC (18)   NULL,
    [Caption]           NVARCHAR (450) NULL,
    [Manufacturer]      NVARCHAR (450) NULL,
    [ProtocolSupported] NUMERIC (18)   NULL,
    [Lastchanged]       DATETIME       CONSTRAINT [DF_tblScsicontrollerhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]            NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblScsicontrollerhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblScsicontrollerhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblScsicontrollerhist_tblAssets]
    ON [dbo].[tblScsiControllerHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

