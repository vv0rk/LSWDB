CREATE TABLE [dbo].[tsysSerialTranslation] (
    [SerialTranslationId] INT            IDENTITY (1, 1) NOT NULL,
    [Regex]               NVARCHAR (256) NOT NULL,
    [Serial]              NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_tsysSerialTranslation] PRIMARY KEY CLUSTERED ([SerialTranslationId] ASC) WITH (FILLFACTOR = 90),
    UNIQUE NONCLUSTERED ([Regex] ASC) WITH (FILLFACTOR = 90)
);

