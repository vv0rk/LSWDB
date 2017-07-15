CREATE TABLE [dbo].[tsysSystemSkuTranslation] (
    [SystemSkuTranslationId] INT            IDENTITY (1, 1) NOT NULL,
    [Regex]                  NVARCHAR (256) NOT NULL,
    [SystemSku]              NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_tsysSystemSkuTranslation] PRIMARY KEY CLUSTERED ([SystemSkuTranslationId] ASC) WITH (FILLFACTOR = 90),
    UNIQUE NONCLUSTERED ([Regex] ASC) WITH (FILLFACTOR = 90)
);

