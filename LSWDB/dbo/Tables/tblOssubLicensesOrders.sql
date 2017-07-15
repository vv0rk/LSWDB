CREATE TABLE [dbo].[tblOssubLicensesOrders] (
    [OSLicensesuborderid] INT            IDENTITY (1, 1) NOT NULL,
    [OSLicenseidID]       INT            NOT NULL,
    [Orderdate]           DATETIME       CONSTRAINT [DF_tblOssubLicensesorders_Orderdate] DEFAULT (getdate()) NULL,
    [Nrlicenses]          INT            NULL,
    [Priceperlicense]     MONEY          CONSTRAINT [DF_tblOssubLicensesorders_Priceperlicense] DEFAULT ((0)) NULL,
    [Ordernumber]         NVARCHAR (255) NULL,
    [Comments]            NTEXT          NULL,
    [Licensekey]          NTEXT          NULL,
    CONSTRAINT [PK_tblOssubLicensesorders] PRIMARY KEY CLUSTERED ([OSLicensesuborderid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblOssubLicensesOrders_tblOsLicenses] FOREIGN KEY ([OSLicenseidID]) REFERENCES [dbo].[tblOsLicenses] ([OSLicenseidID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblOssubLicensesOrders_tblOsLicenses]
    ON [dbo].[tblOssubLicensesOrders]([OSLicenseidID] ASC) WITH (FILLFACTOR = 90);

