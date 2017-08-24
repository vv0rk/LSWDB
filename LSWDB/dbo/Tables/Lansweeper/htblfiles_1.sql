CREATE TABLE [dbo].[htblfiles] (
    [fileid]   INT            IDENTITY (1, 1) NOT NULL,
    [uid]      NVARCHAR (50)  NULL,
    [bithash]  NVARCHAR (250) NULL,
    [uploaded] DATETIME       NULL,
    CONSTRAINT [PK_htblfiles] PRIMARY KEY CLUSTERED ([fileid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [UQ_bithash] UNIQUE NONCLUSTERED ([bithash] ASC) WITH (FILLFACTOR = 90)
);

