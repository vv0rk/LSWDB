CREATE TABLE [dbo].[rSpravochnik]
(
	[Id] INT NOT NULL PRIMARY KEY identity(1,1),
	[idAssetType] int null,
	[idManufacturer] int null,
	[partNumber] nvarchar(255) not null,
	[Name] nvarchar(255) not null,
	[Resource] int null,	-- определяется для ресурсных РМ
	[idFormatPrinter] int null,	-- формат принтера 
	[Price] float null,		-- цена позиции
	-- партнамбер должен быть уникален
    CONSTRAINT [CK_rSpravochnik_partNumber] Unique (partNumber), 
    CONSTRAINT [FK_rSpravochnik_rManufacturer] FOREIGN KEY (idManufacturer) REFERENCES rManufacturer(id), 
    CONSTRAINT [FK_rSpravochnik_rFormatPrinter] FOREIGN KEY (idFormatPrinter) REFERENCES rFormatPrinter(id), 
    CONSTRAINT [FK_rSpravochnik_tsysAssetTypes] FOREIGN KEY (idAssetType) REFERENCES tsysAssetTypes(AssetType)
)
