CREATE TABLE [dbo].[tsysreportpages] (
    [HomepageID]    INT            IDENTITY (1, 1) NOT NULL,
    [HomepageQuery] NVARCHAR (200) NOT NULL,
    [Sortorder]     NUMERIC (18)   NOT NULL,
    [Priority]      NUMERIC (18)   NOT NULL,
    [Showcolor]     BIT            NOT NULL,
    [PageID]        INT            CONSTRAINT [DF_tsysreportpages_PageID] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_tsysreportpages] PRIMARY KEY CLUSTERED ([HomepageID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysreportpages_tsyspages] FOREIGN KEY ([PageID]) REFERENCES [dbo].[tsyspages] ([PageID]) NOT FOR REPLICATION,
    CONSTRAINT [FK_tsysreportpages_tsysreports] FOREIGN KEY ([HomepageQuery]) REFERENCES [dbo].[tsysreports] ([Reportquery]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
ALTER TABLE [dbo].[tsysreportpages] NOCHECK CONSTRAINT [FK_tsysreportpages_tsyspages];


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysreportpages_tsyspages]
    ON [dbo].[tsysreportpages]([PageID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysreportpages_tsysreports]
    ON [dbo].[tsysreportpages]([HomepageQuery] ASC) WITH (FILLFACTOR = 90);

