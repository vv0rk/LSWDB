CREATE TABLE [dbo].[tblSublicensesOrders] (
    [LicensesuborderID] INT            IDENTITY (1, 1) NOT NULL,
    [LicenseidID]       INT            NOT NULL,
    [Orderdate]         DATETIME       CONSTRAINT [DF_tblsublicensesorders_Orderdate] DEFAULT (getdate()) NOT NULL,
    [Nrlicenses]        INT            NOT NULL,
    [Priceperlicense]   MONEY          CONSTRAINT [DF_tblsublicensesorders_Priceperlicense] DEFAULT ((0)) NOT NULL,
    [Ordernumber]       NVARCHAR (255) NULL,
    [Comments]          NTEXT          NULL,
    [Licensekey]        NTEXT          NULL,
    CONSTRAINT [PK_tblsublicensesorders] PRIMARY KEY CLUSTERED ([LicensesuborderID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblSublicensesOrders_tblLicenses] FOREIGN KEY ([LicenseidID]) REFERENCES [dbo].[tblLicenses] ([LicenseidID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblSublicensesOrders_tblLicenses]
    ON [dbo].[tblSublicensesOrders]([LicenseidID] ASC) WITH (FILLFACTOR = 90);

