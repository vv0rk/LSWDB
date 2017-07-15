CREATE TABLE [dbo].[tblScsiController] (
    [WIN32_SCSICONTROLLERid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                INT            NOT NULL,
    [Availability]           NUMERIC (18)   NULL,
    [Caption]                NVARCHAR (450) NULL,
    [Manufacturer]           NVARCHAR (450) NULL,
    [ProtocolSupported]      NUMERIC (18)   NULL,
    [Lastchanged]            DATETIME       CONSTRAINT [DF_tblScsicontroller_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblScsicontroller] PRIMARY KEY CLUSTERED ([WIN32_SCSICONTROLLERid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblScsicontroller_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblScsicontroller_tblAssets]
    ON [dbo].[tblScsiController]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

