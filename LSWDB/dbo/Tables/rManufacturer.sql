CREATE TABLE [dbo].[rManufacturer] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [FullName]  NVARCHAR (255) NULL,
    [ShortName] NVARCHAR (100) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [AK_ShortName] UNIQUE NONCLUSTERED ([ShortName] ASC) WITH (FILLFACTOR = 90)
);

