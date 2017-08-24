CREATE TABLE [dbo].[tblGroups] (
    [UserID]      INT      IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT      NOT NULL,
    [GroupID]     INT      NOT NULL,
    [Lastchanged] DATETIME CONSTRAINT [DF_tblGroups_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblGroups] PRIMARY KEY CLUSTERED ([UserID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblGroups_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblGroups_tblGroupUni] FOREIGN KEY ([GroupID]) REFERENCES [dbo].[tblGroupUni] ([GroupID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblGroups_tblAssets]
    ON [dbo].[tblGroups]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblGroups_tblGroupUni]
    ON [dbo].[tblGroups]([GroupID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

