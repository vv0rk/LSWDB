CREATE TABLE [dbo].[rBudget]
(
	[Id] INT identity(1,1) NOT NULL PRIMARY KEY,
	Org nvarchar(100) null,
	Filial nvarchar(100) null,
	-- это относится к товару - заявке
	partNumber nvarchar(200) null,
	Name nvarchar(255) null,
	[CountYear] int null,
	cQ1 int null,
	cQ2 int null,
	cQ3 int null,
	cQ4 int null,
	----------------------------------
	-- Это место куда или кому планируется ресурс из этой заявки.
	FIO nvarchar(100) null,
	Job nvarchar(255) null,
	Dep nvarchar(255) null,
	Gorod nvarchar(100) null,
	Address nvarchar(255) null,
	Office nvarchar(100) null,
	target nvarchar (255) null,
	device nvarchar(100)  null,
	SourceInfo nvarchar(255) null,
	keyUniq nvarchar(100) null, -- уникальный ключ передаваемый иногда для обеспечения уникальности записи
	----------------------------------
	-- это ссылки на справочники которые могут быть сформированы по воле модератора который консилидирует заявки
	AssetId int null,
	idPartNumber int null,
	idlinkToInfo int null, 
	idOrg int null,
	idFilial int null,
    CONSTRAINT [FK_rBudget_rBudgetSourceInfo] FOREIGN KEY (idLinkToInfo) REFERENCES rBudgetSourceInfo(id), 
    CONSTRAINT [FK_rBudget_rCompany_idOrg] FOREIGN KEY (idOrg) REFERENCES [rCompany$]([id]), 
    CONSTRAINT [FK_rBudget_rCompany_idFilial] FOREIGN KEY ([idFilial]) REFERENCES [rCompany$]([id]), 
    CONSTRAINT [FK_rBudget_rBudgerSprav] FOREIGN KEY ([idPartNumber]) REFERENCES rBudgetSprav(id)

)
