CREATE TABLE [dbo].[tblLinuxSoftware] (
    [SoftwareID]    INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT            NOT NULL,
    [SoftwareUniID] INT            NOT NULL,
    [Version]       NVARCHAR (50)  NULL,
    [Release]       NVARCHAR (50)  NULL,
    [Architecture]  NVARCHAR (255) NULL,
    [Desired]       NVARCHAR (20)  NULL,
    [Status]        NVARCHAR (20)  NULL,
    [Error]         NVARCHAR (20)  NULL,
    [InstallDate]   NVARCHAR (100) NULL,
    [LastChanged]   DATETIME       CONSTRAINT [DF_tblLinuxSoftware_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblLinuxSoftware] PRIMARY KEY CLUSTERED ([SoftwareID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxSoftware_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE,
    CONSTRAINT [FK_tblLinuxSoftware_tblSoftwareUni] FOREIGN KEY ([SoftwareUniID]) REFERENCES [dbo].[tblSoftwareUni] ([SoftID])
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxSoftware_tblAssets]
    ON [dbo].[tblLinuxSoftware]([AssetID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxSoftware_tblSoftwareUni]
    ON [dbo].[tblLinuxSoftware]([SoftwareUniID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblLinuxSoftware_6_944930638__K3_K1_K2]
    ON [dbo].[tblLinuxSoftware]([SoftwareUniID] ASC, [SoftwareID] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90);

