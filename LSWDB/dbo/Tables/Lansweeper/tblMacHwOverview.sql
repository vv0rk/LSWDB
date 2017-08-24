CREATE TABLE [dbo].[tblMacHwOverview] (
    [HwOverviewID]     INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]          INT           NOT NULL,
    [MachineName]      NVARCHAR (50) NULL,
    [MachineModel]     NVARCHAR (50) NULL,
    [CPUType]          NVARCHAR (50) NULL,
    [NrOfCPUs]         INT           NULL,
    [CPUSpeed]         NVARCHAR (50) NULL,
    [L2CachePerCPU]    NVARCHAR (50) NULL,
    [Memory]           NVARCHAR (50) NULL,
    [BusSpeed]         NVARCHAR (50) NULL,
    [BootROMVersion]   NVARCHAR (50) NULL,
    [SerialNumber]     NVARCHAR (50) NULL,
    [Packages]         INT           NULL,
    [PlatformUUID]     NVARCHAR (50) NULL,
    [SMCVersionSystem] NVARCHAR (50) NULL,
    [LastChanged]      DATETIME      CONSTRAINT [DF_tblMacHwOverview_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblMacHwOverview] PRIMARY KEY CLUSTERED ([HwOverviewID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMacHwOverview_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMacHwOverview_tblAssets]
    ON [dbo].[tblMacHwOverview]([AssetID] ASC) WITH (FILLFACTOR = 90);

