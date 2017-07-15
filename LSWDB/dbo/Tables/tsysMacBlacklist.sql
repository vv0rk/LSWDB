CREATE TABLE [dbo].[tsysMacBlacklist] (
    [MacBlacklistId] INT            IDENTITY (1, 1) NOT NULL,
    [Mac]            NVARCHAR (128) NOT NULL,
    [Comment]        NVARCHAR (512) NULL,
    [LastChanged]    DATETIME       DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tsysMacBlacklist] PRIMARY KEY CLUSTERED ([MacBlacklistId] ASC) WITH (FILLFACTOR = 90),
    UNIQUE NONCLUSTERED ([Mac] ASC) WITH (FILLFACTOR = 90)
);

