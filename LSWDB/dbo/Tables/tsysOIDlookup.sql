CREATE TABLE [dbo].[tsysOIDlookup] (
    [OID]      VARCHAR (300)  NOT NULL,
    [Itemtype] INT            CONSTRAINT [DF_tsysOIDlookup_Itemtype] DEFAULT ((1)) NOT NULL,
    [Model]    NVARCHAR (255) NOT NULL,
    [LookupID] INT            IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_tsysOIDlookup] PRIMARY KEY CLUSTERED ([LookupID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysOIDlookup_tsysAssetTypes] FOREIGN KEY ([Itemtype]) REFERENCES [dbo].[tsysAssetTypes] ([AssetType]) ON DELETE CASCADE,
    CONSTRAINT [AK_OID] UNIQUE NONCLUSTERED ([OID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysOIDlookup_tsysAssetTypes]
    ON [dbo].[tsysOIDlookup]([Itemtype] ASC) WITH (FILLFACTOR = 90);

