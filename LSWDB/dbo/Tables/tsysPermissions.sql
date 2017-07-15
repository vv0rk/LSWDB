CREATE TABLE [dbo].[tsysPermissions] (
    [PermissionID] INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (300) NOT NULL,
    [Icon]         NVARCHAR (300) NULL,
    CONSTRAINT [PK_tsysPermissions] PRIMARY KEY CLUSTERED ([PermissionID] ASC) WITH (FILLFACTOR = 90)
);

