CREATE TABLE [dbo].[tblIEBars] (
    [IEbarID]     INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Control]     NVARCHAR (100) NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblIEBars_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblIEBars] PRIMARY KEY CLUSTERED ([IEbarID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblIEBars_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblIEBars_tblAssets]
    ON [dbo].[tblIEBars]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

