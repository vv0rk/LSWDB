CREATE TABLE [dbo].[tblHyperVGuest] (
    [hypervguestID] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT            NOT NULL,
    [Name]          NVARCHAR (255) NULL,
    [Enabledstate]  BIGINT         NULL,
    [Healthstate]   BIGINT         NULL,
    [Lastchanged]   DATETIME       CONSTRAINT [DF_tblHyperVGuest_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Memory]        INT            NULL,
    [InstanceID]    NVARCHAR (50)  NULL,
    CONSTRAINT [PK_tblHyperVGuest] PRIMARY KEY CLUSTERED ([hypervguestID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblHyperVGuest_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblHyperVGuest_tblAssets]
    ON [dbo].[tblHyperVGuest]([AssetID] ASC) WITH (FILLFACTOR = 90);

