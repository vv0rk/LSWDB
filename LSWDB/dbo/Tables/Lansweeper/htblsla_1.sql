CREATE TABLE [dbo].[htblsla] (
    [slaid]     INT           IDENTITY (1, 1) NOT NULL,
    [name]      NVARCHAR (75) NOT NULL,
    [hours]     INT           DEFAULT ((0)) NOT NULL,
    [initial]   DATETIME      DEFAULT ('1900-01-01 12:00:00.000') NOT NULL,
    [resolved]  DATETIME      DEFAULT ('1900-01-02 12:00:00.000') NOT NULL,
    [color1]    NCHAR (10)    DEFAULT ('#114506') NOT NULL,
    [color2]    NCHAR (10)    DEFAULT ('#a89718') NOT NULL,
    [sortorder] INT           DEFAULT ((500)) NOT NULL,
    [enabled]   BIT           DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_htblsla] PRIMARY KEY CLUSTERED ([slaid] ASC) WITH (FILLFACTOR = 90)
);

