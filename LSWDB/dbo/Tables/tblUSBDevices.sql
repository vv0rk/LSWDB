CREATE TABLE [dbo].[tblUSBDevices] (
    [Win32_USBDeviceid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]           INT            NOT NULL,
    [Name]              NVARCHAR (450) NULL,
    [Manufacturer]      NVARCHAR (450) NULL,
    [DeviceID]          NVARCHAR (450) NULL,
    [LastChanged]       DATETIME       CONSTRAINT [DF_tblUSBDevices_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblUSBDevices] PRIMARY KEY CLUSTERED ([Win32_USBDeviceid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblUSBDevices_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblUSBDevices_tblAssets]
    ON [dbo].[tblUSBDevices]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

