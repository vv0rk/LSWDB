CREATE TABLE [dbo].[tblSqlLicenseDocs] (
    [DocID]     INT             IDENTITY (1, 1) NOT NULL,
    [LicenseID] INT             NOT NULL,
    [Doclink]   NVARCHAR (1000) NULL,
    [Docname]   NVARCHAR (255)  NULL,
    [Comments]  NTEXT           NULL,
    PRIMARY KEY CLUSTERED ([DocID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblSqlLicenseDocs_tblSqlLicenses] FOREIGN KEY ([LicenseID]) REFERENCES [dbo].[tblSqlLicenses] ([LicenseID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblSqlLicenseDocs_tblSqlLicenses]
    ON [dbo].[tblSqlLicenseDocs]([LicenseID] ASC) WITH (FILLFACTOR = 90);

