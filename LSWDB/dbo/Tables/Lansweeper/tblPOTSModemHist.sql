CREATE TABLE [dbo].[tblPOTSModemHist] (
    [Trackercode]             INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT            NOT NULL,
    [AttachedTo]              NVARCHAR (50)  NULL,
    [Caption]                 NVARCHAR (450) NULL,
    [CountrySelected]         NVARCHAR (500) NULL,
    [DeviceType]              NVARCHAR (500) NULL,
    [MaxBaudRateToPhone]      NUMERIC (18)   NULL,
    [MaxBaudRateToSerialPort] NUMERIC (18)   NULL,
    [ProviderName]            NVARCHAR (500) NULL,
    [Lastchanged]             DATETIME       CONSTRAINT [DF_tblPOTSModemhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                  NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblPOTSModemhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblPOTSModemhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPOTSModemhist_tblAssets]
    ON [dbo].[tblPOTSModemHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

