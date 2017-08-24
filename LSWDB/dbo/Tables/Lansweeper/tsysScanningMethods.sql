CREATE TABLE [dbo].[tsysScanningMethods] (
    [ScanningMethodId] INT            NOT NULL,
    [ScanningMethod]   NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([ScanningMethodId] ASC) WITH (FILLFACTOR = 90)
);

