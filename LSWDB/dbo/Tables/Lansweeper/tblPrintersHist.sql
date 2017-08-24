CREATE TABLE [dbo].[tblPrintersHist] (
    [Trackercode]            INT            IDENTITY (1, 1) NOT NULL,
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
    [Lastchanged]            DATETIME       CONSTRAINT [DF_tblPrintershist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                 NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblPrintershist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblPrintershist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPrintershist_tblAssets]
    ON [dbo].[tblPrintersHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

