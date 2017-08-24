CREATE TABLE [dbo].[htblticketssummary] (
    [summaryid]    INT            IDENTITY (1, 1) NOT NULL,
    [userid]       INT            NOT NULL,
    [customtime]   BIT            DEFAULT ((0)) NOT NULL,
    [standardtime] INT            DEFAULT ((1)) NOT NULL,
    [time1]        DATETIME       DEFAULT (dateadd(day,(-7),getdate())) NOT NULL,
    [time2]        DATETIME       DEFAULT (getdate()) NOT NULL,
    [endtoday]     BIT            DEFAULT ((1)) NOT NULL,
    [tickettypes]  NVARCHAR (150) DEFAULT ('') NULL,
    [teams]        NVARCHAR (150) DEFAULT ('') NULL,
    [agents]       NVARCHAR (150) DEFAULT ('') NULL,
    [s1]           NVARCHAR (50)  NULL,
    [s2]           NVARCHAR (50)  NULL,
    [s3]           NVARCHAR (50)  NULL,
    [sort]         INT            DEFAULT ((1)) NOT NULL,
    [order]        INT            DEFAULT ((0)) NOT NULL,
    [amount]       INT            DEFAULT ((100)) NOT NULL,
    CONSTRAINT [PK_htblticketsummary] PRIMARY KEY CLUSTERED ([summaryid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblticketssummary_htblusers] FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblticketssummary_htblusers]
    ON [dbo].[htblticketssummary]([userid] ASC) WITH (FILLFACTOR = 90);

