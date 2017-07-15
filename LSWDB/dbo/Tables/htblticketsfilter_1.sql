CREATE TABLE [dbo].[htblticketsfilter] (
    [filterid]    INT             IDENTITY (1, 1) NOT NULL,
    [tablefilter] NVARCHAR (50)   NOT NULL,
    [field]       NVARCHAR (100)  NULL,
    [filtervalue] NVARCHAR (4000) NOT NULL,
    [operator]    NVARCHAR (3)    NULL,
    [comparator]  INT             NOT NULL,
    [grouped]     INT             CONSTRAINT [DF_htblticketsfilter_grouped] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_htblticketsfilter] PRIMARY KEY CLUSTERED ([filterid] ASC) WITH (FILLFACTOR = 90)
);

