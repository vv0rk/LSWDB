CREATE TABLE [dbo].[tblUsersInGroupHist] (
    [Trackercode] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Groupname]   NVARCHAR (300) NULL,
    [Domainname]  NVARCHAR (200) NULL,
    [Username]    NVARCHAR (200) NULL,
    [Accounttype] NUMERIC (18)   NULL,
    [Admingroup]  BIT            CONSTRAINT [DF_tblUsersInGrouphist_Admingroup] DEFAULT ((0)) NOT NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblUsersInGrouphist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblUsersInGrouphist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblUsersInGrouphist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblUsersInGrouphist_tblAssets]
    ON [dbo].[tblUsersInGroupHist]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

