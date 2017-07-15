CREATE TABLE [dbo].[htblemailverification] (
    [verificationid] INT            IDENTITY (1, 1) NOT NULL,
    [userid]         INT            NOT NULL,
    [email]          NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_htblemailverification] PRIMARY KEY CLUSTERED ([verificationid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblemailverification_htblusers] FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblemailverification_htblusers]
    ON [dbo].[htblemailverification]([userid] ASC) WITH (FILLFACTOR = 90);

