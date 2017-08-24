CREATE TABLE [dbo].[htblreports] (
    [reportid] INT            NOT NULL,
    [title]    NVARCHAR (200) NOT NULL,
    [query]    NTEXT          NOT NULL,
    [builtin]  BIT            DEFAULT ((0)) NULL,
    CONSTRAINT [PK_htblreports] PRIMARY KEY CLUSTERED ([reportid] ASC) WITH (FILLFACTOR = 90)
);

