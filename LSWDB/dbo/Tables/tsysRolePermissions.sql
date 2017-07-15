CREATE TABLE [dbo].[tsysRolePermissions] (
    [RolePermissionID] INT IDENTITY (1, 1) NOT NULL,
    [RoleID]           INT NOT NULL,
    [PermissionID]     INT NOT NULL,
    CONSTRAINT [PK_tsysRolePermissions] PRIMARY KEY CLUSTERED ([RolePermissionID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysRolePermissions_tsysPermissions] FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[tsysPermissions] ([PermissionID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_tsysRolePermissions_tsysRolePermissions] FOREIGN KEY ([RoleID]) REFERENCES [dbo].[tsysRoles] ([RoleID]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysRolePermissions_tsysRoles]
    ON [dbo].[tsysRolePermissions]([RoleID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_tsysRolePermissions_tsysPermissions]
    ON [dbo].[tsysRolePermissions]([PermissionID] ASC) WITH (FILLFACTOR = 90);

