CREATE TABLE [dbo].[rHJournal] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [idAsset]      INT            NOT NULL,
    [idScl1]       INT            NULL,
    [idScl2]       INT            NULL,
    [idJprev]      INT            NULL,
    [idStatus]     INT            NOT NULL,
    [userCreate]   NVARCHAR (255) NULL,
    [dateCreate]   DATETIME       NULL,
    [userApprove]  NVARCHAR (255) NULL,
    [dateApprove]  DATETIME       NULL,
    [Comment]      NVARCHAR (255) NULL,
    [idSclStatus1] INT            NULL,
    [idSclStatus2] INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_rHJournal_rAssetsImported_idAsset_Id] FOREIGN KEY ([idAsset]) REFERENCES [dbo].[rAssetsImported] ([id]),
    CONSTRAINT [FK_rHJournal_rHJournal_idJPrev_Id] FOREIGN KEY ([idJprev]) REFERENCES [dbo].[rHJournal] ([Id]),
    CONSTRAINT [FK_rHJournal_rHJStatus_idStatus_id] FOREIGN KEY ([idStatus]) REFERENCES [dbo].[rHJStatus] ([Id]),
    CONSTRAINT [FK_rHJournal_rHSclad_idScl1_Id] FOREIGN KEY ([idScl1]) REFERENCES [dbo].[rHSclad] ([Id]),
    CONSTRAINT [FK_rHJournal_rHSclad_idScl2_Id] FOREIGN KEY ([idScl2]) REFERENCES [dbo].[rHSclad] ([Id]),
    CONSTRAINT [FK_rHJournal_rHScladStatus_idSclStatus1_id] FOREIGN KEY ([idSclStatus1]) REFERENCES [dbo].[rHScladStatus] ([Id]),
    CONSTRAINT [FK_rHJournal_rHScladStatus_idSclStatus2_id] FOREIGN KEY ([idSclStatus2]) REFERENCES [dbo].[rHScladStatus] ([Id])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rHJournal] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rHJournal] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rHJournal] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rHJournal] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rHJournal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rHJournal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rHJournal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rHJournal] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rHJournal] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rHJournal] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rHJournal] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rHJournal] TO [IE\UIT_USERS_VR]
    AS [dbo];

