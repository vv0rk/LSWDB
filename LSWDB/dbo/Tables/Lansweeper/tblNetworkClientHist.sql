CREATE TABLE [dbo].[tblNetworkClientHist] (
    [Trackercode]  INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]      INT            NOT NULL,
    [Caption]      NVARCHAR (450) NULL,
    [Manufacturer] NVARCHAR (450) NULL,
    [Name]         NVARCHAR (450) NULL,
    [Lastchanged]  DATETIME       CONSTRAINT [DF_tblNetworkClienthist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]       NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblNetworkClienthist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblNetworkClienthist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblNetworkClienthist_tblAssets]
    ON [dbo].[tblNetworkClientHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

