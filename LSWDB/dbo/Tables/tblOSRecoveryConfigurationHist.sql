CREATE TABLE [dbo].[tblOSRecoveryConfigurationHist] (
    [Trackercode]                INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                    INT            NOT NULL,
    [AutoReboot]                 BIT            NULL,
    [DebugFilePath]              NVARCHAR (450) NULL,
    [DebugInfoType]              NUMERIC (18)   NULL,
    [KernelDumpOnly]             BIT            NULL,
    [MiniDumpDirectory]          NVARCHAR (450) NULL,
    [OverwriteExistingDebugFile] BIT            NULL,
    [SendAdminAlert]             BIT            NULL,
    [WriteDebugInfo]             BIT            NULL,
    [WriteToSystemLog]           BIT            NULL,
    [Lastchanged]                DATETIME       CONSTRAINT [DF_tblOSRecoveryConfigurationhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                     NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblOSRecoveryConfigurationhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblOSRecoveryConfigurationhist_tblComputers] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblOSRecoveryConfigurationhist_tblComputers]
    ON [dbo].[tblOSRecoveryConfigurationHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

