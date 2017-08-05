CREATE TABLE [dbo].[rBudgetPurchase]
(
	[Id] INT NOT NULL identity(1,1) PRIMARY KEY,
	Org nvarchar(100) null,
	Filial nvarchar(100) null,
	partNumber nvarchar(100) null,
	Name nvarchar(255) null,
	TypeLicense nvarchar(50) null,
	Count int null,
	DatePurchase datetime null,
	DateExpire datetime null,

	-- здесь задается связь со справочником
	idPartNumber int null,
	idOrg int null,
	idFilial int null,
    CONSTRAINT [FK_rBudgetPurchase_rCompany_idOrg] FOREIGN KEY (idOrg) REFERENCES [rCompany$]([id]), 
    CONSTRAINT [FK_rBudgetPurchase_rCompany_idFilial] FOREIGN KEY ([idFilial]) REFERENCES [rCompany$]([id]), 
    CONSTRAINT [FK_rBudgetPurchase_rBudgerSprav] FOREIGN KEY ([idPartNumber]) REFERENCES rBudgetSprav(id)
)
