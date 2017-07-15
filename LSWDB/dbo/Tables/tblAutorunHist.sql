CREATE TABLE [dbo].[tblAutorunHist] (
    [Trackercode] INT          IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT          NOT NULL,
    [AutorunUNI]  INT          NULL,
    [LocationID]  INT          NULL,
    [Lastchanged] DATETIME     CONSTRAINT [DF_tblAutorunhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18) NOT NULL,
    CONSTRAINT [PK_tblAutorunhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblAutorunhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblAutorunhist_tblAssets]
    ON [dbo].[tblAutorunHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

