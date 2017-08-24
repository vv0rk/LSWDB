CREATE TABLE [dbo].[tblProxy] (
    [ProxyID]         INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]         INT            NOT NULL,
    [Proxyportnumber] NVARCHAR (50)  NULL,
    [Proxyserver]     NVARCHAR (450) NULL,
    [Lastchanged]     DATETIME       CONSTRAINT [DF_tblProxy_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblProxy] PRIMARY KEY CLUSTERED ([ProxyID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblProxy_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblProxy_tblAssets]
    ON [dbo].[tblProxy]([AssetID] ASC) WITH (FILLFACTOR = 90);

