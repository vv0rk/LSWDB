CREATE TABLE [dbo].[htblagents] (
    [agentid]              INT      IDENTITY (1, 1) NOT NULL,
    [userid]               INT      NOT NULL,
    [active]               BIT      NULL,
    [notificationschecked] DATETIME DEFAULT (getdate()) NOT NULL,
    [footer]               NTEXT    DEFAULT ('') NULL,
    [disabledbysystem]     BIT      DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_htblagents] PRIMARY KEY CLUSTERED ([agentid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblagents_htblusers] FOREIGN KEY ([userid]) REFERENCES [dbo].[htblusers] ([userid]) ON DELETE CASCADE,
    UNIQUE NONCLUSTERED ([userid] ASC) WITH (FILLFACTOR = 90)
);

