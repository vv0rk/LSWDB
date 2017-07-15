CREATE TABLE [dbo].[htblcustomticketfilteritems] (
    [filteritemid] INT            IDENTITY (1, 1) NOT NULL,
    [filterid]     INT            NOT NULL,
    [type]         INT            NOT NULL,
    [itemid]       INT            NOT NULL,
    [value]        NVARCHAR (150) NULL,
    CONSTRAINT [PK_htblcustomticketfilteritems] PRIMARY KEY CLUSTERED ([filteritemid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblcustomticketfilteritems_htblcustomticketfilters] FOREIGN KEY ([filterid]) REFERENCES [dbo].[htblcustomticketfilters] ([filterid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblcustomticketfilteritems_htblcustomticketfilters]
    ON [dbo].[htblcustomticketfilteritems]([filterid] ASC) WITH (FILLFACTOR = 90);

