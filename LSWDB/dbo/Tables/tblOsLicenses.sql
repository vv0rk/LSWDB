CREATE TABLE [dbo].[tblOsLicenses] (
    [OSLicenseidID]   INT            IDENTITY (1, 1) NOT NULL,
    [OS]              NVARCHAR (450) NOT NULL,
    [Priceperlicense] MONEY          CONSTRAINT [DF_tblOsLicenses_Priceperlicense] DEFAULT ((0)) NOT NULL,
    [Comments]        NTEXT          NULL,
    [LicenseContact]  NVARCHAR (500) NULL,
    [LicenseOwner]    NVARCHAR (255) NULL,
    CONSTRAINT [PK_tblOsLicenses] PRIMARY KEY CLUSTERED ([OSLicenseidID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [IX_tblOsLicenses] UNIQUE NONCLUSTERED ([OS] ASC) WITH (FILLFACTOR = 90)
);

