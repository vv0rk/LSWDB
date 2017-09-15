/*
	Нормы расходных материалов установленные на определенный период
*/
CREATE TABLE [dbo].[rNormMaterialRashod]
(
	[Id] INT NOT NULL PRIMARY KEY identity(1,1),
	[AssetId] int not null, 
	idMaterialOriginal int not null,
	Quantity int not null default 0,
	Date datetime not null, 
	-- алгоритм по которому норма расчитана
    [idAlgoritm] INT NOT NULL, 
	-- норма сброшена 
    [isResetNorm] BIT NOT NULL default 0, 
    [Username] NVARCHAR(150) NULL
    --CONSTRAINT [FK_rNormMaterialRashod_rNormAlgoritm] FOREIGN KEY ([idAlgoritm]) REFERENCES rNormAlgoritm(Id)
, 
    [isApproved] BIT NOT NULL DEFAULT 0)
