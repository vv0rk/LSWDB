CREATE TABLE [dbo].[tblQuickFixEngineeringInstalledBy] (
    [InstalledByID] INT            IDENTITY (1, 1) NOT NULL,
    [InstalledBy]   NVARCHAR (350) NULL,
    CONSTRAINT [PK_tblQFEinstalledby] PRIMARY KEY CLUSTERED ([InstalledByID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblQuickFixEngineeringInstalledBy_installedby]
    ON [dbo].[tblQuickFixEngineeringInstalledBy]([InstalledBy] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

