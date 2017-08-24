CREATE TABLE [dbo].[tblSqlLicensesServerOrders] (
    [Licenseorderid]  INT            IDENTITY (1, 1) NOT NULL,
    [LicenseID]       INT            NOT NULL,
    [Orderdate]       DATETIME       NULL,
    [Nrlicenses]      INT            NULL,
    [Priceperlicense] MONEY          NULL,
    [Ordernumber]     NVARCHAR (255) NULL,
    [Comments]        NTEXT          NULL,
    PRIMARY KEY CLUSTERED ([Licenseorderid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblSqlLicensesServerOrders_tblSqlLicenses] FOREIGN KEY ([LicenseID]) REFERENCES [dbo].[tblSqlLicenses] ([LicenseID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblSqlLicensesServerOrders_tblSqlLicenses]
    ON [dbo].[tblSqlLicensesServerOrders]([LicenseID] ASC) WITH (FILLFACTOR = 90);

