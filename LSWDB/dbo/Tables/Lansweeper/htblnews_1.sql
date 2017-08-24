CREATE TABLE [dbo].[htblnews] (
    [newsid]      INT            IDENTITY (1, 1) NOT NULL,
    [type]        INT            NOT NULL,
    [text]        NTEXT          NOT NULL,
    [description] NVARCHAR (100) NOT NULL,
    [enabled]     BIT            DEFAULT ((1)) NULL,
    [sort]        INT            NULL,
    CONSTRAINT [PK_htblnews] PRIMARY KEY CLUSTERED ([newsid] ASC) WITH (FILLFACTOR = 90)
);

