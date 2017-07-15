CREATE TABLE [dbo].[tblDCOMApplicationHist] (
    [Trackercode] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Caption]     NVARCHAR (450) NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblDCOMApplicationhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblDCOMApplicationhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblDCOMApplicationhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblDCOMApplicationhist_tblAssets]
    ON [dbo].[tblDCOMApplicationHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

