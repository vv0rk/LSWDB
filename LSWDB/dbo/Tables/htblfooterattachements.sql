CREATE TABLE [dbo].[htblfooterattachements] (
    [attachmentid] INT            IDENTITY (1, 1) NOT NULL,
    [userid]       INT            NULL,
    [fileid]       INT            NOT NULL,
    [mediatype]    NVARCHAR (100) NOT NULL,
    [contentid]    NVARCHAR (100) NULL,
    [filename]     NVARCHAR (256) NULL,
    CONSTRAINT [PK_htblfooterattachements] PRIMARY KEY CLUSTERED ([attachmentid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([fileid]) REFERENCES [dbo].[htblfiles] ([fileid]) ON DELETE CASCADE,
    FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblfooterattachements_htblusers]
    ON [dbo].[htblfooterattachements]([userid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblfooterattachements_htblfiles]
    ON [dbo].[htblfooterattachements]([fileid] ASC) WITH (FILLFACTOR = 90);

