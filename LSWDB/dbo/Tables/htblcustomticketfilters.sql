CREATE TABLE [dbo].[htblcustomticketfilters] (
    [filterid]    INT            IDENTITY (1, 1) NOT NULL,
    [title]       NVARCHAR (100) NOT NULL,
    [agents]      NVARCHAR (500) DEFAULT ('') NOT NULL,
    [clients]     NVARCHAR (500) DEFAULT ('') NOT NULL,
    [flagged]     INT            DEFAULT ((0)) NOT NULL,
    [datefrom]    DATETIME       NULL,
    [dateto]      DATETIME       NULL,
    [spam]        BIT            DEFAULT ((0)) NULL,
    [userid]      INT            NULL,
    [assigned]    BIT            DEFAULT ((0)) NULL,
    [unassigned]  BIT            DEFAULT ((0)) NULL,
    [related]     BIT            DEFAULT ((0)) NULL,
    [slaovertime] BIT            DEFAULT ((0)) NULL,
    [subscribed]  BIT            DEFAULT ((0)) NULL,
    [agentinit]   BIT            DEFAULT ((0)) NULL,
    [search]      NVARCHAR (150) DEFAULT ('') NULL,
    [unanswered]  BIT            DEFAULT ((0)) NULL,
    [sort]        INT            CONSTRAINT [DF_htblcustomticketfilterst_sort] DEFAULT ((1)) NULL,
    [order]       NVARCHAR (5)   CONSTRAINT [DF_htblcustomticketfilterst_order] DEFAULT ('asc') NULL,
    [top]         INT            CONSTRAINT [DF_htblcustomticketfilterst_top] DEFAULT ((100)) NULL,
    CONSTRAINT [PK_htblcustomticketfilters] PRIMARY KEY CLUSTERED ([filterid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblcustomticketfilters_htblusers]
    ON [dbo].[htblcustomticketfilters]([userid] ASC) WITH (FILLFACTOR = 90);

