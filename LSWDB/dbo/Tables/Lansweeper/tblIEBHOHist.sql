CREATE TABLE [dbo].[tblIEBHOHist] (
    [Trackercode] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Control]     NVARCHAR (100) NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblIEBHOhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblIEBHOhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblIEBHOhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblIEBHOhist_tblAssets]
    ON [dbo].[tblIEBHOHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

