CREATE TABLE [dbo].[tblCustDevPrinter] (
    [DevprintID]     INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]        INT            NOT NULL,
    [Tonernr]        NUMERIC (18)   NULL,
    [Tonername]      NVARCHAR (150) NULL,
    [TonerColorName] NVARCHAR (100) NULL,
    [TonerColorNr]   NUMERIC (18)   NULL,
    [TonerMaximum]   NUMERIC (18)   NULL,
    [TonerRemaining] NUMERIC (18)   NULL,
    [Lastchanged]    DATETIME       CONSTRAINT [DF_tblCustDevPrinter_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblCustDevPrinter] PRIMARY KEY CLUSTERED ([DevprintID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblCustDevPrinter_tblassets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblCustDevPrinter_tblassets]
    ON [dbo].[tblCustDevPrinter]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

