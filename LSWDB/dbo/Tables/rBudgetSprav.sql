CREATE TABLE [dbo].[rBudgetSprav]
(
	[Id] INT identity (1,1) NOT NULL PRIMARY KEY,
	Manufacturer nvarchar(255) not null,
	partNumber nvarchar(255) not null,
	Name nvarchar(255) not null,
	Price float null,
	TypeOfPosition nvarchar(50) null,
	-- рекомендуемая номенклатура. Номенклатура которая будет рассчитываться для закупки
	partNumberRec nvarchar(255) null,
	NameRec nvarchar(255) null,
	PriceRec float null,
	-- это относится к лицензиям
	TypeLicense nvarchar(50) null,	-- тип лицензии постоянная или временная подписка
	CoverPercent float null,			-- принимаемое в компании область покрытия
	-- статья бюджета
	level1 nvarchar(100) null,
	level2 nvarchar(100) null,
	-- источник информации
	SourceInfo nvarchar(255) null,
	-- ключи для связи со справочниками
	idlinkToInfo int null,
	CONSTRAINT [FK_rBudgetSprav_rBudgetSourceInfo] FOREIGN KEY (idLinkToInfo) REFERENCES rBudgetSourceInfo(id)

)
