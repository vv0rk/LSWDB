CREATE TABLE [dbo].[tsysLanguages] (
    [LanguageId]   INT           NOT NULL,
    [Name]         NVARCHAR (50) NOT NULL,
    [EnglishName]  NVARCHAR (50) NOT NULL,
    [LanguageCode] NVARCHAR (10) NOT NULL,
    [Enabled]      BIT           DEFAULT ((0)) NOT NULL,
    [Supported]    BIT           DEFAULT ((0)) NOT NULL,
    [CultureName]  NVARCHAR (20) NULL,
    CONSTRAINT [UQ_LanguageId] UNIQUE NONCLUSTERED ([LanguageId] ASC) WITH (FILLFACTOR = 90)
);

