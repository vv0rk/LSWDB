CREATE TABLE [dbo].[tsysRoles] (
    [RoleID]  INT            IDENTITY (1, 1) NOT NULL,
    [Name]    NVARCHAR (300) NOT NULL,
    [Default] BIT            CONSTRAINT [DF_tsysRoles_Default] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_tsysRoles] PRIMARY KEY CLUSTERED ([RoleID] ASC) WITH (FILLFACTOR = 90)
);

