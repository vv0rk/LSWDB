CREATE TABLE [dbo].[tblIDEControllerHist] (
    [Trackercode]       INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]           INT            NOT NULL,
    [Caption]           NVARCHAR (450) NULL,
    [Manufacturer]      NVARCHAR (450) NULL,
    [ProtocolSupported] NUMERIC (18)   NULL,
    [Lastchanged]       DATETIME       CONSTRAINT [DF_tblIDEControllerhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]            NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblIDEControllerhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblIDEControllerhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblIDEControllerhist_tblAssets]
    ON [dbo].[tblIDEControllerHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

