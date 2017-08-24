CREATE TABLE [dbo].[tsysOS] (
    [OScode]    VARCHAR (50)  NOT NULL,
    [OSname]    VARCHAR (200) NOT NULL,
    [Image]     VARCHAR (50)  NOT NULL,
    [Sortorder] INT           NOT NULL,
    CONSTRAINT [PK_tsysOS] PRIMARY KEY CLUSTERED ([OScode] ASC) WITH (FILLFACTOR = 90)
);

