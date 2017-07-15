CREATE TABLE [dbo].[tblADMembership] (
    [ChildAdObjectID]  INT      NOT NULL,
    [ParentAdObjectID] INT      NOT NULL,
    [lastChanged]      DATETIME CONSTRAINT [DF_tblADMembership_lastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblADMembership] PRIMARY KEY CLUSTERED ([ParentAdObjectID] ASC, [ChildAdObjectID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblADMembership_tblADObject] FOREIGN KEY ([ParentAdObjectID]) REFERENCES [dbo].[tblADObjects] ([ADObjectID]) ON DELETE CASCADE,
    CONSTRAINT [FK_tblADMembership_tblADObject1] FOREIGN KEY ([ChildAdObjectID]) REFERENCES [dbo].[tblADObjects] ([ADObjectID])
);

