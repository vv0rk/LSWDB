CREATE TABLE [dbo].[tblPOTSModem] (
    [Win32_POTSModemid]       INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT            NOT NULL,
    [AttachedTo]              NVARCHAR (50)  NULL,
    [Caption]                 NVARCHAR (450) NULL,
    [CountrySelected]         NVARCHAR (500) NULL,
    [DeviceType]              NVARCHAR (500) NULL,
    [MaxBaudRateToPhone]      NUMERIC (18)   NULL,
    [MaxBaudRateToSerialPort] NUMERIC (18)   NULL,
    [ProviderName]            NVARCHAR (500) NULL,
    [Lastchanged]             DATETIME       CONSTRAINT [DF_tblPOTSModem_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblPOTSModem] PRIMARY KEY CLUSTERED ([Win32_POTSModemid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblPOTSModem_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPOTSModem_tblAssets]
    ON [dbo].[tblPOTSModem]([AssetID] ASC) WITH (FILLFACTOR = 90);

