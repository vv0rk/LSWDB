CREATE TABLE [dbo].[tblSqlSubServers] (
    [SubServerID] INT            IDENTITY (1, 1) NOT NULL,
    [LicenseID]   INT            NOT NULL,
    [Name]        NVARCHAR (300) NULL,
    [AssetName]   NVARCHAR (300) NULL,
    PRIMARY KEY CLUSTERED ([SubServerID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblSqlSubServers_tblSqlLicenses] FOREIGN KEY ([LicenseID]) REFERENCES [dbo].[tblSqlLicenses] ([LicenseID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblSqlSubServers_tblSqlLicenses]
    ON [dbo].[tblSqlSubServers]([LicenseID] ASC) WITH (FILLFACTOR = 90);

