CREATE TABLE [dbo].[rHistStateAsset]
(
	[Id] INT NOT NULL PRIMARY KEY identity(1,1), 
    [AssetId] INT NOT NULL, 
    [State] INT NOT NULL, 
    [DateCheck] DATETIME NOT NULL, 
    CONSTRAINT [FK_rHistStateAsset_tblAssets] FOREIGN KEY ([AssetId]) REFERENCES [tblAssets]([AssetId]) on delete cascade, 
    CONSTRAINT [FK_rHistStateAsset_tblState] FOREIGN KEY ([State]) REFERENCES [tblState]([State]) on delete cascade
)
