CREATE TABLE [dbo].[tblIEBarsHist] (
    [Trackercode] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Control]     NVARCHAR (100) NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblIEBarshist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblIEBarshist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblIEBarshist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblIEBarshist_tblAssets]
    ON [dbo].[tblIEBarsHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

