CREATE TABLE [dbo].[tblIDEController] (
    [Win32_IDEControllerid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]               INT            NOT NULL,
    [Caption]               NVARCHAR (450) NULL,
    [Manufacturer]          NVARCHAR (450) NULL,
    [ProtocolSupported]     NUMERIC (18)   NULL,
    [Lastchanged]           DATETIME       CONSTRAINT [DF_tblIDEController_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblIDEController] PRIMARY KEY CLUSTERED ([Win32_IDEControllerid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblIDEController_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblIDEController_tblAssets]
    ON [dbo].[tblIDEController]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

