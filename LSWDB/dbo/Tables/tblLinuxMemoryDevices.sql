CREATE TABLE [dbo].[tblLinuxMemoryDevices] (
    [MemoryDeviceID] INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]        INT           NOT NULL,
    [TotalWidth]     NVARCHAR (20) NULL,
    [DataWidth]      NVARCHAR (20) NULL,
    [Size]           NVARCHAR (20) NULL,
    [FormFactor]     NVARCHAR (20) NULL,
    [Set]            NVARCHAR (20) NULL,
    [Locator]        NVARCHAR (20) NULL,
    [BankLocator]    NVARCHAR (20) NULL,
    [Type]           NVARCHAR (20) NULL,
    [TypeDetail]     NVARCHAR (20) NULL,
    [Speed]          NVARCHAR (20) NULL,
    [Manufacturer]   NVARCHAR (20) NULL,
    [SerialNumber]   NVARCHAR (20) NULL,
    [LastChanged]    DATETIME      CONSTRAINT [DF_tblLinuxMemoryDevices_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxMemoryDevices] PRIMARY KEY CLUSTERED ([MemoryDeviceID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxMemoryDevices_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxMemoryDevices_tblAssets]
    ON [dbo].[tblLinuxMemoryDevices]([AssetID] ASC) WITH (FILLFACTOR = 90);

