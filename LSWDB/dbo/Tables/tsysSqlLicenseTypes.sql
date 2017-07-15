CREATE TABLE [dbo].[tsysSqlLicenseTypes] (
    [LicenseType]     INT            NOT NULL,
    [LicenseTypeName] NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([LicenseType] ASC) WITH (FILLFACTOR = 90)
);

