CREATE TABLE [dbo].[tsysPackageLogType] (
    [TypeID] INT           IDENTITY (1, 1) NOT NULL,
    [Name]   NVARCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([TypeID] ASC) WITH (FILLFACTOR = 90)
);

