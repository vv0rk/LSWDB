CREATE TABLE [dbo].[tblLicenses] (
    [LicenseidID]         INT            IDENTITY (1, 1) NOT NULL,
    [softwareName]        NVARCHAR (300) NOT NULL,
    [Priceperlicense]     MONEY          CONSTRAINT [DF_tbllicenses_Priceperlicense] DEFAULT ((0)) NOT NULL,
    [LicenseType]         INT            NULL,
    [LicenseTypeComments] NTEXT          NULL,
    [LicenseContract]     BIT            CONSTRAINT [DF_tblLicenses_SupportContract] DEFAULT ((0)) NOT NULL,
    [LicenseExpiration]   DATETIME       NULL,
    [Comments]            NTEXT          NULL,
    [LicenseContact]      NVARCHAR (500) NULL,
    [LicenseOwner]        NVARCHAR (255) NULL,
    CONSTRAINT [PK_tbllicenses] PRIMARY KEY CLUSTERED ([LicenseidID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLicenses_tsyslicensetype] FOREIGN KEY ([LicenseType]) REFERENCES [dbo].[tsyslicensetype] ([LicenseType]) NOT FOR REPLICATION,
    CONSTRAINT [IX_tblLicenses] UNIQUE NONCLUSTERED ([softwareName] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLicenses_tsyslicensetype]
    ON [dbo].[tblLicenses]([LicenseType] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tblLicenses_5]
    ON [dbo].[tblLicenses]([LicenseidID] ASC, [softwareName] ASC, [Priceperlicense] ASC, [LicenseContact] ASC, [LicenseOwner] ASC) WITH (FILLFACTOR = 90);

