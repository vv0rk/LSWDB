CREATE TABLE [dbo].[tblComputerSystemProduct] (
    [Win32_ComputerSystemProductid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                       INT            NOT NULL,
    [UUID]                          NVARCHAR (450) NULL,
    [Version]                       NVARCHAR (450) NULL,
    [Lastchanged]                   DATETIME       CONSTRAINT [DF_tblComputerSystemProduct_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblComputerSystemProduct] PRIMARY KEY CLUSTERED ([Win32_ComputerSystemProductid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblComputerSystemProduct_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblComputerSystemProduct_tblAssets]
    ON [dbo].[tblComputerSystemProduct]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

