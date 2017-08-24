CREATE TABLE [dbo].[rNormRM]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [AssetId] INT NOT NULL, 
    [idMaterialOriginal] INT NOT NULL, 
    [Year] INT NOT NULL default 1970, 
    [Quart] INT NOT NULL default 2, 
	[Number] int not null default 0,
    [isManual] BIT NOT NULL default 0
)
