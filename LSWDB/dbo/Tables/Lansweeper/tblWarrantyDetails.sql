CREATE TABLE [dbo].[tblWarrantyDetails] (
    [WarrantyDetailsId] INT             IDENTITY (1, 1) NOT NULL,
    [WarrantyId]        INT             NULL,
    [WarrantyStartDate] DATETIME        NULL,
    [WarrantyEndDate]   DATETIME        NOT NULL,
    [ServiceType]       NVARCHAR (1024) NOT NULL,
    [LastChanged]       DATETIME        DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblWarrantyDetails] PRIMARY KEY CLUSTERED ([WarrantyDetailsId] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblWarrantyDetails_tblWarranty] FOREIGN KEY ([WarrantyId]) REFERENCES [dbo].[tblWarranty] ([WarrantyId]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblWarrantyDetails_tblWarranty]
    ON [dbo].[tblWarrantyDetails]([WarrantyId] ASC) WITH (FILLFACTOR = 90);

