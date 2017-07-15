CREATE TABLE [dbo].[htblemailfilters] (
    [filterid] INT            IDENTITY (1, 1) NOT NULL,
    [type]     INT            NOT NULL,
    [filter]   NVARCHAR (250) NULL,
    CONSTRAINT [PK_htblemailfilters] PRIMARY KEY CLUSTERED ([filterid] ASC) WITH (FILLFACTOR = 90)
);

