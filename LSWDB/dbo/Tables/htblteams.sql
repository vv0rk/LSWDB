CREATE TABLE [dbo].[htblteams] (
    [teamid]   INT           IDENTITY (1, 1) NOT NULL,
    [teamname] NVARCHAR (50) NULL,
    [color]    NCHAR (10)    NULL,
    [img]      NVARCHAR (50) NULL,
    CONSTRAINT [PK_htblteams] PRIMARY KEY CLUSTERED ([teamid] ASC) WITH (FILLFACTOR = 90)
);

