CREATE TABLE [dbo].[tblLanguages] (
    [LanguageCode] INT           NOT NULL,
    [Language]     VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_tblLanguages] PRIMARY KEY CLUSTERED ([LanguageCode] ASC) WITH (FILLFACTOR = 90)
);

