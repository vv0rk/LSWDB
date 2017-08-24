CREATE TABLE [dbo].[htblemailtemplatesattachements] (
    [attachmentid] INT            IDENTITY (1, 1) NOT NULL,
    [templateid]   INT            NULL,
    [fileid]       INT            NOT NULL,
    [mediatype]    NVARCHAR (100) NOT NULL,
    [contentid]    NVARCHAR (100) NULL,
    [filename]     NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_htblemailtemplatesattachements] PRIMARY KEY CLUSTERED ([attachmentid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([fileid]) REFERENCES [dbo].[htblfiles] ([fileid]) ON DELETE CASCADE,
    FOREIGN KEY ([templateid]) REFERENCES [dbo].[htblemailtemplates] ([templateid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblemailtemplatesattachements_htblfiles]
    ON [dbo].[htblemailtemplatesattachements]([fileid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblemailtemplatesattachements_htblemailtemplates]
    ON [dbo].[htblemailtemplatesattachements]([templateid] ASC) WITH (FILLFACTOR = 90);

