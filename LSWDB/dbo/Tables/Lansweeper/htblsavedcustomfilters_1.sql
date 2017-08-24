CREATE TABLE [dbo].[htblsavedcustomfilters] (
    [saveid]     INT             IDENTITY (1, 1) NOT NULL,
    [userid]     INT             NOT NULL,
    [filterdata] NVARCHAR (2500) DEFAULT ('') NOT NULL,
    [sortorder]  INT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_htblsavedcustomfilters] PRIMARY KEY CLUSTERED ([saveid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblsavedcustomfilters_htblusers]
    ON [dbo].[htblsavedcustomfilters]([userid] ASC) WITH (FILLFACTOR = 90);

