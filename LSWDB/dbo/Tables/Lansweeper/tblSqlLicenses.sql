CREATE TABLE [dbo].[tblSqlLicenses] (
    [LicenseID]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]                NVARCHAR (300) NULL,
    [PricePerServer]      MONEY          NULL,
    [LicenseType]         INT            NULL,
    [LicenseTypeComments] NTEXT          NULL,
    [NrOfTerms]           INT            NULL,
    [PricePerTerm]        MONEY          NULL,
    [Comments]            NTEXT          NULL,
    [LicenseContact]      NVARCHAR (500) NULL,
    [LicenseOwner]        NVARCHAR (255) NULL,
    [SharedCAL]           BIT            NULL,
    [LicenseExpiration]   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([LicenseID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblSqlLicenses_tsysSqlLicenseTypes] FOREIGN KEY ([LicenseType]) REFERENCES [dbo].[tsysSqlLicenseTypes] ([LicenseType])
);


GO
CREATE NONCLUSTERED INDEX [IX_tblSqlLicenses_tsysSqlLicenseTypes]
    ON [dbo].[tblSqlLicenses]([LicenseType] ASC) WITH (FILLFACTOR = 90);

