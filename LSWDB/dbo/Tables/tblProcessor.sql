CREATE TABLE [dbo].[tblProcessor] (
    [WIN32_PROCESSORid]         INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                   INT            NOT NULL,
    [AddressWidth]              NUMERIC (18)   NULL,
    [Architecture]              NUMERIC (18)   NULL,
    [Availability]              NUMERIC (18)   NULL,
    [Caption]                   NVARCHAR (450) NULL,
    [CpuStatus]                 NUMERIC (18)   NULL,
    [DataWidth]                 NUMERIC (18)   NULL,
    [DeviceID]                  NVARCHAR (450) NULL,
    [ExtClock]                  NUMERIC (18)   NULL,
    [Family]                    NUMERIC (18)   NULL,
    [L2CacheSize]               NUMERIC (18)   NULL,
    [L2CacheSpeed]              NUMERIC (18)   NULL,
    [Level]                     NUMERIC (18)   NULL,
    [Manufacturer]              NVARCHAR (450) NULL,
    [MaxClockSpeed]             NUMERIC (18)   NULL,
    [Name]                      NVARCHAR (450) NULL,
    [NumberOfCores]             NUMERIC (18)   NULL,
    [NumberOfLogicalProcessors] NUMERIC (18)   NULL,
    [ProcessorId]               NVARCHAR (300) NULL,
    [ProcessorType]             NUMERIC (18)   NULL,
    [Revision]                  NUMERIC (18)   NULL,
    [SocketDesignation]         NVARCHAR (450) NULL,
    [Stepping]                  NVARCHAR (50)  NULL,
    [UniqueId]                  NVARCHAR (300) NULL,
    [UpgradeMethod]             NUMERIC (18)   NULL,
    [Version]                   NVARCHAR (500) NULL,
    [VoltageCaps]               NUMERIC (18)   NULL,
    [Lastchanged]               DATETIME       CONSTRAINT [DF_tblPROCESSOR_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblPROCESSOR] PRIMARY KEY CLUSTERED ([WIN32_PROCESSORid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblPROCESSOR_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblPROCESSOR_7_771585887__K2_K1_20_1040]
    ON [dbo].[tblProcessor]([AssetID] ASC, [WIN32_PROCESSORid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

