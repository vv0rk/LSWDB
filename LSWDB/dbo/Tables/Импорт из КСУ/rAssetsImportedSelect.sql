/*
	Флаг для выбора порядка 
*/
CREATE TABLE [dbo].[rAssetsImportedSelect]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Selected] NVARCHAR(50) NULL
)