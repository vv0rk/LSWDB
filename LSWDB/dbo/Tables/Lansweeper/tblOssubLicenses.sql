CREATE TABLE [dbo].[tblOssubLicenses] (
    [OSLicensesubid] INT            IDENTITY (1, 1) NOT NULL,
    [OSLicenseidID]  INT            NOT NULL,
    [OS]             NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_tblOssubLicenses] PRIMARY KEY CLUSTERED ([OSLicensesubid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblOssubLicenses_tblOsLicenses] FOREIGN KEY ([OSLicenseidID]) REFERENCES [dbo].[tblOsLicenses] ([OSLicenseidID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblOssubLicenses_tblOsLicenses]
    ON [dbo].[tblOssubLicenses]([OSLicenseidID] ASC) WITH (FILLFACTOR = 90);

