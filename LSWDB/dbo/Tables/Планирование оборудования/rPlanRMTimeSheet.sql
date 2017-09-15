/* 
	Это таблица не план закупок а план потребления
	план закупок = план потребления - запас на складе
*/
CREATE TABLE [dbo].[rPlanRMTimeSheet]
(
	[Id] INT NOT NULL PRIMARY KEY identity(1,1),
	[AssetId] int not null,
	[idMaterialOriginal] int not null,
	[Quantity] int null,
	[Date] datetime null,
	-- 1 эта связка активна и рекомендована для планирования
	[isActive] bit not null default 1,
	-- по умолчанию 0, если ктото руками поправит, то это значение нельзя менять
	[isApproved] bit not null default 0
    CONSTRAINT [AK_rPlanRMTimeSheet_AssetId_idMaterial] UNIQUE (AssetId, idMaterialOriginal, Date)
)
