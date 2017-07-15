CREATE TABLE [dbo].[tsysManufacturerTranslation] (
    [ManufacturerTranslationId] INT            IDENTITY (1, 1) NOT NULL,
    [Regex]                     NVARCHAR (256) NOT NULL,
    [Manufacturer]              NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_tsysManufacturerTranslation] PRIMARY KEY CLUSTERED ([ManufacturerTranslationId] ASC) WITH (FILLFACTOR = 90),
    UNIQUE NONCLUSTERED ([Regex] ASC) WITH (FILLFACTOR = 90)
);

