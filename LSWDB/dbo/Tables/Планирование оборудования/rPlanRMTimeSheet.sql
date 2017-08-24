CREATE TABLE [dbo].[rPlanRMTimeSheet]
(
	[Id] INT NOT NULL PRIMARY KEY identity(1,1),
	[AssetId] int not null,
	[idMaterialOriginal] int not null,
	[Quantity] int null,
	[Date] datetime null
)
