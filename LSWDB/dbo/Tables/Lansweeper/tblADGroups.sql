CREATE TABLE [dbo].[tblADGroups] (
    [ADGroupID]         INT            IDENTITY (1, 1) NOT NULL,
    [ADObjectID]        INT            NOT NULL,
    [ManagerADObjectId] INT            NULL,
    [GroupType]         INT            NULL,
    [LastChanged]       DATETIME       CONSTRAINT [DF_ADGroups_LastChanged] DEFAULT (getdate()) NOT NULL,
    [Description]       NVARCHAR (500) NULL,
    [Name]              NVARCHAR (500) NULL,
    CONSTRAINT [PK_tblADGroups] PRIMARY KEY CLUSTERED ([ADGroupID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblADGroups_tblADObjects] FOREIGN KEY ([ManagerADObjectId]) REFERENCES [dbo].[tblADObjects] ([ADObjectID]),
    CONSTRAINT [FK_tblADGroups_tblADObjects1] FOREIGN KEY ([ADObjectID]) REFERENCES [dbo].[tblADObjects] ([ADObjectID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblADGroups_tblADObjects]
    ON [dbo].[tblADGroups]([ManagerADObjectId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblADGroups_tblADObjects1]
    ON [dbo].[tblADGroups]([ADObjectID] ASC) WITH (FILLFACTOR = 90);

