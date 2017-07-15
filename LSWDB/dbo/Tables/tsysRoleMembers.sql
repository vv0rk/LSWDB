CREATE TABLE [dbo].[tsysRoleMembers] (
    [MemberID] INT            IDENTITY (1, 1) NOT NULL,
    [RoleID]   INT            NOT NULL,
    [Member]   NVARCHAR (150) NULL,
    CONSTRAINT [PK_tsysRoleMembers] PRIMARY KEY CLUSTERED ([MemberID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysRoleMembers_tsysRoles] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[tsysRoles] ([RoleID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysRoleMembers_tsysRoles]
    ON [dbo].[tsysRoleMembers]([RoleID] ASC) WITH (FILLFACTOR = 90);

