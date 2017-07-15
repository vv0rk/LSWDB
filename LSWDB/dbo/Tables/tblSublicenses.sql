CREATE TABLE [dbo].[tblSublicenses] (
    [LicensesubID]    INT            IDENTITY (1, 1) NOT NULL,
    [LicenseidID]     INT            NOT NULL,
    [softwareName]    NVARCHAR (300) NOT NULL,
    [softwareVersion] NVARCHAR (100) CONSTRAINT [DF_tblsublicenses_softwareVersion] DEFAULT ('') NULL,
    CONSTRAINT [PK_tblsublicenses] PRIMARY KEY CLUSTERED ([LicensesubID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblsublicenses_tblLicenses] FOREIGN KEY ([LicenseidID]) REFERENCES [dbo].[tblLicenses] ([LicenseidID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [IX_tblsublicenses] UNIQUE NONCLUSTERED ([softwareName] ASC, [softwareVersion] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblsublicenses_tblLicenses]
    ON [dbo].[tblSublicenses]([LicenseidID] ASC) WITH (FILLFACTOR = 90);

