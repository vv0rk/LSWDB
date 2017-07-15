CREATE TABLE [dbo].[tblQuickFixEngineering] (
    [Win32_QuickFixEngineeringid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                     INT            NOT NULL,
    [QFEID]                       INT            NOT NULL,
    [InstalledByID]               INT            NOT NULL,
    [InstalledOn]                 NVARCHAR (300) NULL,
    [Lastchanged]                 DATETIME       CONSTRAINT [DF_tblQuickFixEngineering_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblQuickFixEngineering] PRIMARY KEY CLUSTERED ([Win32_QuickFixEngineeringid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblQuickFixEngineering_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblQuickFixEngineering_tblQFEinstalledby] FOREIGN KEY ([InstalledByID]) REFERENCES [dbo].[tblQuickFixEngineeringInstalledBy] ([InstalledByID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_tblQuickFixEngineering_tblQFEUnique] FOREIGN KEY ([QFEID]) REFERENCES [dbo].[tblQuickFixEngineeringUni] ([QFEID]) NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblQuickFixEngineering_tblAssets]
    ON [dbo].[tblQuickFixEngineering]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblQuickFixEngineering_tblQFEinstalledby]
    ON [dbo].[tblQuickFixEngineering]([InstalledByID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblQuickFixEngineering_tblQFEUnique]
    ON [dbo].[tblQuickFixEngineering]([QFEID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

