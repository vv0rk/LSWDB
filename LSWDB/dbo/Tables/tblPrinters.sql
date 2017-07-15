CREATE TABLE [dbo].[tblPrinters] (
    [printerID]              INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                INT            NOT NULL,
    [Capabilitydescriptions] NVARCHAR (500) NULL,
    [Caption]                NVARCHAR (500) NULL,
    [Comment]                NVARCHAR (500) NULL,
    [EnableBIDI]             BIT            NULL,
    [Horizontalresolution]   NUMERIC (18)   NULL,
    [Local]                  BIT            NULL,
    [Location]               NVARCHAR (450) NULL,
    [Network]                BIT            NULL,
    [Portname]               NVARCHAR (250) NULL,
    [Printjobdatatype]       NVARCHAR (50)  NULL,
    [Printprocessor]         NVARCHAR (50)  NULL,
    [Sharename]              NVARCHAR (500) NULL,
    [Status]                 NVARCHAR (50)  NULL,
    [verticalresolution]     NUMERIC (18)   NULL,
    [Lastchanged]            DATETIME       CONSTRAINT [DF_tblPrinters_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Printers] PRIMARY KEY CLUSTERED ([printerID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblPrinters_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPrinters_tblAssets]
    ON [dbo].[tblPrinters]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

