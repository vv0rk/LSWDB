CREATE TABLE [dbo].[tblOssubLicenseDocs] (
    [OSLicensesubdocid] INT             IDENTITY (1, 1) NOT NULL,
    [OSLicenseidID]     INT             NOT NULL,
    [Doclink]           NVARCHAR (1000) NULL,
    [Docname]           NVARCHAR (255)  NULL,
    [Comments]          NTEXT           NULL,
    CONSTRAINT [PK_tblOssubLicensedeocs] PRIMARY KEY CLUSTERED ([OSLicensesubdocid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblOssubLicenseDocs_tblOsLicenses] FOREIGN KEY ([OSLicenseidID]) REFERENCES [dbo].[tblOsLicenses] ([OSLicenseidID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblOssubLicenseDocs_tblOsLicenses]
    ON [dbo].[tblOssubLicenseDocs]([OSLicenseidID] ASC) WITH (FILLFACTOR = 90);

