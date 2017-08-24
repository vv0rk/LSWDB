CREATE TABLE [dbo].[tblOSRecoveryConfiguration] (
    [Win32_OSRecoveryConfigurationid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                         INT            NOT NULL,
    [AutoReboot]                      BIT            NULL,
    [DebugFilePath]                   NVARCHAR (450) NULL,
    [DebugInfoType]                   NUMERIC (18)   NULL,
    [KernelDumpOnly]                  BIT            NULL,
    [MiniDumpDirectory]               NVARCHAR (450) NULL,
    [OverwriteExistingDebugFile]      BIT            NULL,
    [SendAdminAlert]                  BIT            NULL,
    [WriteDebugInfo]                  BIT            NULL,
    [WriteToSystemLog]                BIT            NULL,
    [Lastchanged]                     DATETIME       CONSTRAINT [DF_tblOSRecoveryConfiguration_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblOSRecoveryConfiguration] PRIMARY KEY CLUSTERED ([Win32_OSRecoveryConfigurationid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblOSRecoveryConfiguration_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblOSRecoveryConfiguration_tblAssets]
    ON [dbo].[tblOSRecoveryConfiguration]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

