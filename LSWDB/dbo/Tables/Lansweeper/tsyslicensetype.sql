CREATE TABLE [dbo].[tsyslicensetype] (
    [LicenseType]     INT            NOT NULL,
    [LicenseTypeName] NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_tsyslicensetype] PRIMARY KEY CLUSTERED ([LicenseType] ASC) WITH (FILLFACTOR = 90)
);

