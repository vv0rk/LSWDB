CREATE TABLE [dbo].[tblWarranty] (
    [WarrantyId]          INT             IDENTITY (1, 1) NOT NULL,
    [AssetId]             INT             NOT NULL,
    [LastWarrantyTry]     DATETIME        CONSTRAINT [DF_tblWarranty_LastWarrantyTry] DEFAULT (getdate()) NOT NULL,
    [LastWarrantySuccess] DATETIME        NULL,
    [PurchaseCountry]     NVARCHAR (255)  NULL,
    [ShipDate]            DATETIME        NULL,
    [ForceUpdate]         BIT             CONSTRAINT [DF_tblWarranty_ForceUpdate] DEFAULT ((0)) NOT NULL,
    [Error]               NVARCHAR (1024) NULL,
    CONSTRAINT [PK_tblWarranty] PRIMARY KEY CLUSTERED ([WarrantyId] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblWarranty_tblAssets] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblWarranty_tblAssets]
    ON [dbo].[tblWarranty]([AssetId] ASC) WITH (FILLFACTOR = 90);

