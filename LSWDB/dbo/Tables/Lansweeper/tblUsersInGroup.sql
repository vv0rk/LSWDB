CREATE TABLE [dbo].[tblUsersInGroup] (
    [UserInGroupID] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT            NOT NULL,
    [Groupname]     NVARCHAR (300) NULL,
    [Domainname]    NVARCHAR (300) NULL,
    [Username]      NVARCHAR (300) NULL,
    [Accounttype]   NUMERIC (18)   NULL,
    [Admingroup]    BIT            CONSTRAINT [DF_tblUsersInGroup_Admingroup] DEFAULT ((0)) NOT NULL,
    [Lastchanged]   DATETIME       CONSTRAINT [DF_tblUsersInGroups_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblUsersInGroups] PRIMARY KEY CLUSTERED ([UserInGroupID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblUsersInGroup_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblUsersInGroup_7_2127450753__K3_2_5]
    ON [dbo].[tblUsersInGroup]([Groupname] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblUsersInGroup_7_734833880__K7_K2_4_5_8066]
    ON [dbo].[tblUsersInGroup]([Admingroup] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblusersingroupusr]
    ON [dbo].[tblUsersInGroup]([Username] ASC, [Domainname] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblUsersInGroup_tblAssets]
    ON [dbo].[tblUsersInGroup]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE STATISTICS [_dta_stat_734833880_2_4_5]
    ON [dbo].[tblUsersInGroup]([AssetID], [Domainname], [Username]);

