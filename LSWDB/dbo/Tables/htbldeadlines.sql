CREATE TABLE [dbo].[htbldeadlines] (
    [deadlineid]  INT            IDENTITY (1, 1) NOT NULL,
    [image]       NVARCHAR (100) NULL,
    [time]        BIGINT         DEFAULT ((1440)) NULL,
    [description] NVARCHAR (150) NULL,
    CONSTRAINT [PK_htbldeadlines] PRIMARY KEY CLUSTERED ([deadlineid] ASC) WITH (FILLFACTOR = 90)
);

