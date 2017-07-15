CREATE TABLE [dbo].[tblMacOSInfo] (
    [MacOSInfoId]               INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                   INT            NOT NULL,
    [SystemVersion]             NVARCHAR (50)  NULL,
    [KernelVersion]             NVARCHAR (50)  NULL,
    [BootVolume]                NVARCHAR (50)  NULL,
    [BootMode]                  NVARCHAR (50)  NULL,
    [ComputerName]              NVARCHAR (150) NULL,
    [UserName]                  NVARCHAR (150) NULL,
    [SecureVirtualMemory]       NVARCHAR (50)  NULL,
    [SixtyFourBitKernelAndExts] NVARCHAR (50)  NULL,
    [LastChanged]               DATETIME       CONSTRAINT [DF_tblMacOSInfo_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblMacOSInfo] PRIMARY KEY CLUSTERED ([MacOSInfoId] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMacOSInfo_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMacOSInfo_tblAssets]
    ON [dbo].[tblMacOSInfo]([AssetID] ASC) WITH (FILLFACTOR = 90);

