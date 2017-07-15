CREATE TABLE [dbo].[tblProcessorHist] (
    [Trackercode]               INT            IDENTITY (1, 1) NOT NULL,
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
    [Lastchanged]               DATETIME       CONSTRAINT [DF_tblPROCESSORhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                    NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblPROCESSORhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblPROCESSORhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPROCESSORhist_tblAssets]
    ON [dbo].[tblProcessorHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

