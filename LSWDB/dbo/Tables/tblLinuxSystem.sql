CREATE TABLE [dbo].[tblLinuxSystem] (
    [SystemID]            INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]             INT            NOT NULL,
    [Manufacturer]        NVARCHAR (150) NULL,
    [ProductName]         NVARCHAR (150) NULL,
    [Version]             NVARCHAR (150) NULL,
    [Serial]              NVARCHAR (150) NULL,
    [UUID]                NVARCHAR (150) NULL,
    [WakeupTime]          NVARCHAR (150) NULL,
    [BootStatus]          NVARCHAR (150) NULL,
    [NetworkNodeHostname] NVARCHAR (150) NULL,
    [KernelName]          NVARCHAR (150) NULL,
    [KernelRelease]       NVARCHAR (150) NULL,
    [KernelVersion]       NVARCHAR (150) NULL,
    [MachineHardwareName] NVARCHAR (150) NULL,
    [ProcessorType]       NVARCHAR (150) NULL,
    [HardwarePlatform]    NVARCHAR (150) NULL,
    [OperatingSystem]     NVARCHAR (150) NULL,
    [OSRelease]           NVARCHAR (150) NULL,
    [LastChanged]         DATETIME       CONSTRAINT [DF_tblLinuxSystem_LastChanged] DEFAULT (getdate()) NOT NULL,
    [SystemSku]           NVARCHAR (150) NULL,
    CONSTRAINT [PK_tblLinuxSystem] PRIMARY KEY CLUSTERED ([SystemID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxSystem_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxSystem_tblAssets]
    ON [dbo].[tblLinuxSystem]([AssetID] ASC) WITH (FILLFACTOR = 90);

