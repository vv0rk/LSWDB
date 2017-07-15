CREATE TABLE [dbo].[tblUSBController] (
    [Win32_USBControllerid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]               INT            NOT NULL,
    [Caption]               NVARCHAR (450) NULL,
    [Manufacturer]          NVARCHAR (450) NULL,
    [ProtocolSupported]     NUMERIC (18)   NULL,
    [Lastchanged]           DATETIME       CONSTRAINT [DF_tblUSBController_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblUSBController] PRIMARY KEY CLUSTERED ([Win32_USBControllerid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblUSBController_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblUSBController_tblAssets]
    ON [dbo].[tblUSBController]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

