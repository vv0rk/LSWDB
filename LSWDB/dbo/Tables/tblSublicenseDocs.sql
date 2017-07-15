CREATE TABLE [dbo].[tblSublicenseDocs] (
    [LicensesubdocID] INT             IDENTITY (1, 1) NOT NULL,
    [LicenseidID]     INT             NOT NULL,
    [Doclink]         NVARCHAR (1000) NULL,
    [Docname]         NVARCHAR (255)  NULL,
    [Comments]        NTEXT           NULL,
    CONSTRAINT [PK_tblsublicensedocs] PRIMARY KEY CLUSTERED ([LicensesubdocID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblSublicenseDocs_tblLicenses] FOREIGN KEY ([LicenseidID]) REFERENCES [dbo].[tblLicenses] ([LicenseidID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblSublicenseDocs_tblLicenses]
    ON [dbo].[tblSublicenseDocs]([LicenseidID] ASC) WITH (FILLFACTOR = 90);

