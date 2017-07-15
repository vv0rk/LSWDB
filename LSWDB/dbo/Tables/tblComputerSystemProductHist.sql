CREATE TABLE [dbo].[tblComputerSystemProductHist] (
    [Trackercode] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [UUID]        NVARCHAR (450) NULL,
    [Version]     NVARCHAR (450) NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblComputerSystemProducthist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblComputerSystemProducthist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblComputerSystemProducthist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblComputerSystemProducthist_tblAssets]
    ON [dbo].[tblComputerSystemProductHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

