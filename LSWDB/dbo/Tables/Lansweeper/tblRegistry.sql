CREATE TABLE [dbo].[tblRegistry] (
    [RegistryID]  INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT             NOT NULL,
    [Regkey]      NVARCHAR (1000) NULL,
    [Valuename]   NVARCHAR (200)  NULL,
    [Value]       NVARCHAR (500)  NULL,
    [Lastchanged] DATETIME        CONSTRAINT [DF_tblRegistry_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblRegistry] PRIMARY KEY CLUSTERED ([RegistryID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblRegistry_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblRegistry_tblAssets]
    ON [dbo].[tblRegistry]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

