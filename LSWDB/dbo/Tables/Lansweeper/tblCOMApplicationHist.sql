CREATE TABLE [dbo].[tblCOMApplicationHist] (
    [Trackercode] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Caption]     NVARCHAR (450) NULL,
    [lastchanged] DATETIME       CONSTRAINT [DF_tblCOMApplicationhist_lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblCOMApplicationhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblCOMApplicationhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblCOMApplicationhist_tblAssets]
    ON [dbo].[tblCOMApplicationHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

