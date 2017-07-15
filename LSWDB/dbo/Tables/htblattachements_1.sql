CREATE TABLE [dbo].[htblattachements] (
    [attachmentid] INT            IDENTITY (1, 1) NOT NULL,
    [noteid]       INT            NOT NULL,
    [fileid]       INT            NOT NULL,
    [mediatype]    NVARCHAR (100) NOT NULL,
    [contentid]    NVARCHAR (100) NULL,
    [filename]     NVARCHAR (256) NULL,
    [deleted]      BIT            CONSTRAINT [DF_htblattachements_deleted] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_htblattachements] PRIMARY KEY CLUSTERED ([attachmentid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblattachements_htblfiles] FOREIGN KEY ([fileid]) REFERENCES [dbo].[htblfiles] ([fileid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htblattachements_htblnotes] FOREIGN KEY ([noteid]) REFERENCES [dbo].[htblnotes] ([noteid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblattachements_htblfiles]
    ON [dbo].[htblattachements]([fileid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblattachements_htblnotes]
    ON [dbo].[htblattachements]([noteid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblattachements_contentid]
    ON [dbo].[htblattachements]([contentid] ASC) WITH (FILLFACTOR = 90);

