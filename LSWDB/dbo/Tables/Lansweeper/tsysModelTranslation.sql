CREATE TABLE [dbo].[tsysModelTranslation] (
    [ModelTranslationId] INT            IDENTITY (1, 1) NOT NULL,
    [Regex]              NVARCHAR (256) NOT NULL,
    [Model]              NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_tsysModelTranslation] PRIMARY KEY CLUSTERED ([ModelTranslationId] ASC) WITH (FILLFACTOR = 90),
    UNIQUE NONCLUSTERED ([Regex] ASC) WITH (FILLFACTOR = 90)
);

