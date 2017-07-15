CREATE TABLE [dbo].[tblAssetCustom] (
    [CustID]           INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]          INT             NOT NULL,
    [State]            INT             CONSTRAINT [DF_tblAssetCustom_State] DEFAULT ((1)) NOT NULL,
    [PurchaseDate]     DATETIME        NULL,
    [Warrantydate]     DATETIME        NULL,
    [LastPatched]      DATETIME        NULL,
    [LastFullbackup]   DATETIME        NULL,
    [LastFullimage]    DATETIME        NULL,
    [OrderNumber]      NVARCHAR (50)   NULL,
    [Comments]         NTEXT           NULL,
    [Location]         NVARCHAR (300)  NULL,
    [LocationLock]     BIT             NULL,
    [Building]         NVARCHAR (300)  NULL,
    [Department]       NVARCHAR (300)  NULL,
    [Branchoffice]     NVARCHAR (50)   NULL,
    [BarCode]          NVARCHAR (100)  NULL,
    [Manufacturer]     NVARCHAR (200)  NULL,
    [ManufacturerLock] BIT             NULL,
    [Contact]          NVARCHAR (300)  NULL,
    [ContactLock]      BIT             NULL,
    [Model]            NVARCHAR (200)  NULL,
    [ModelLock]        BIT             NULL,
    [HTTPTitle]        NVARCHAR (1000) NULL,
    [HttpServer]       NVARCHAR (500)  NULL,
    [HttpsServer]      NVARCHAR (500)  NULL,
    [SnmpOID]          VARCHAR (150)   NULL,
    [SMTPheader]       NVARCHAR (500)  NULL,
    [FTPheader]        NVARCHAR (500)  NULL,
    [Lastchanged]      DATETIME        CONSTRAINT [DF_tblAssetCustom_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Serialnumber]     NVARCHAR (100)  NULL,
    [SerialnumberLock] BIT             NULL,
    [Printedpages]     NUMERIC (18)    NULL,
    [Printerstatus]    NVARCHAR (100)  NULL,
    [Custom1]          NVARCHAR (255)  NULL,
    [Custom2]          NVARCHAR (255)  NULL,
    [Custom3]          NVARCHAR (255)  NULL,
    [Custom4]          NVARCHAR (255)  NULL,
    [Custom5]          NVARCHAR (255)  NULL,
    [Custom6]          NVARCHAR (255)  NULL,
    [Custom7]          NVARCHAR (255)  NULL,
    [Custom8]          NVARCHAR (255)  NULL,
    [Custom9]          NVARCHAR (255)  NULL,
    [Custom10]         NVARCHAR (255)  NULL,
    [Custom11]         NVARCHAR (255)  NULL,
    [Custom12]         NVARCHAR (255)  NULL,
    [Custom13]         NVARCHAR (255)  NULL,
    [Custom14]         NVARCHAR (255)  NULL,
    [Custom15]         NVARCHAR (255)  NULL,
    [Custom16]         NVARCHAR (255)  NULL,
    [Custom17]         NVARCHAR (255)  NULL,
    [Custom18]         NVARCHAR (255)  NULL,
    [Custom19]         NVARCHAR (255)  NULL,
    [Custom20]         NVARCHAR (255)  NULL,
    [DNSName]          NVARCHAR (500)  NULL,
    [SSHServer]        NVARCHAR (255)  NULL,
    [PurchaseDateLock] BIT             NULL,
    [WarrantyDateLock] BIT             NULL,
    [SystemSKU]        NVARCHAR (200)  NULL,
    [PreventCleanup]   BIT             DEFAULT ((0)) NULL,
    [LockSystemSKU]    BIT             DEFAULT ((0)) NULL,
    [DmidecodeError]   BIT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_tblAssetCustom] PRIMARY KEY CLUSTERED ([CustID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblAssetCustom_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION,
    CONSTRAINT [FK_tblAssetCustom_tblState] FOREIGN KEY ([State]) REFERENCES [dbo].[tblState] ([State]) NOT FOR REPLICATION,
    UNIQUE NONCLUSTERED ([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K16_K2]
    ON [dbo].[tblAssetCustom]([BarCode] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K30_2_17]
    ON [dbo].[tblAssetCustom]([Serialnumber] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K35_2]
    ON [dbo].[tblAssetCustom]([Custom1] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K36_K2_K30_9_16_17_35_37_38_39_40_41_42_43_44_45_46_47_48_49_50_51_52_53_54]
    ON [dbo].[tblAssetCustom]([Custom2] ASC, [AssetID] ASC, [Serialnumber] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K37_K2]
    ON [dbo].[tblAssetCustom]([Custom3] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K38_K2_K30_9_16_17_35_36_37_39_40_41_42_43_44_45_46_47_48_49_50_51_52_53_54]
    ON [dbo].[tblAssetCustom]([Custom4] ASC, [AssetID] ASC, [Serialnumber] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K39_K2]
    ON [dbo].[tblAssetCustom]([Custom5] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K40_K2_K30_9_16_17_35_36_37_38_39_41_42_43_44_45_46_47_48_49_50_51_52_53_54]
    ON [dbo].[tblAssetCustom]([Custom6] ASC, [AssetID] ASC, [Serialnumber] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K41_K2]
    ON [dbo].[tblAssetCustom]([Custom7] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K42_K2]
    ON [dbo].[tblAssetCustom]([Custom8] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K43_K2_K30_9_16_17_35_36_37_38_39_40_41_42_44_45_46_47_48_49_50_51_52_53_54]
    ON [dbo].[tblAssetCustom]([Custom9] ASC, [AssetID] ASC, [Serialnumber] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K44_K2_K30_9_16_17_35_36_37_38_39_40_41_42_43_45_46_47_48_49_50_51_52_53_54]
    ON [dbo].[tblAssetCustom]([Custom10] ASC, [AssetID] ASC, [Serialnumber] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K45_K2]
    ON [dbo].[tblAssetCustom]([Custom11] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K46_K2_K30_9_16_17_35_36_37_38_39_40_41_42_43_44_45_47_48_49_50_51_52_53_54]
    ON [dbo].[tblAssetCustom]([Custom12] ASC, [AssetID] ASC, [Serialnumber] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K47_K2_K30_9_16_17_35_36_37_38_39_40_41_42_43_44_45_46_48_49_50_51_52_53_54]
    ON [dbo].[tblAssetCustom]([Custom13] ASC, [AssetID] ASC, [Serialnumber] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K48_K2]
    ON [dbo].[tblAssetCustom]([Custom14] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K49_K2]
    ON [dbo].[tblAssetCustom]([Custom15] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K50_K2]
    ON [dbo].[tblAssetCustom]([Custom16] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K51_K2]
    ON [dbo].[tblAssetCustom]([Custom17] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K52_K2]
    ON [dbo].[tblAssetCustom]([Custom18] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K53_K2]
    ON [dbo].[tblAssetCustom]([Custom19] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K54_2_9_16_17_30_35_36_37_38_39_40_41_42_43_44_45_46_47_48_49_50_51_52_53]
    ON [dbo].[tblAssetCustom]([Custom20] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_5_2027362487__K9_K2]
    ON [dbo].[tblAssetCustom]([OrderNumber] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_7_85783563__K2_3_11_27_31_9987]
    ON [dbo].[tblAssetCustom]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_7_85783563__K2_K3_2533]
    ON [dbo].[tblAssetCustom]([AssetID] ASC, [State] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_7_85783563__K2_K3_K27_K31_11_39]
    ON [dbo].[tblAssetCustom]([AssetID] ASC, [State] ASC, [Manufacturer] ASC, [Model] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_7_85783563__K3_27]
    ON [dbo].[tblAssetCustom]([State] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_7_85783563__K3_K2_27_31_4364]
    ON [dbo].[tblAssetCustom]([State] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_7_85783563__K3_K2_5543]
    ON [dbo].[tblAssetCustom]([State] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_7_85783563__K3_K39_K2_K31_27_8066]
    ON [dbo].[tblAssetCustom]([State] ASC, [SnmpOID] ASC, [AssetID] ASC, [Model] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssetCustom_7_85783563__K5D_K3_2_9987]
    ON [dbo].[tblAssetCustom]([Warrantydate] DESC, [State] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom2]
    ON [dbo].[tblAssetCustom]([Custom2] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom3]
    ON [dbo].[tblAssetCustom]([Custom3] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom4]
    ON [dbo].[tblAssetCustom]([Custom4] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom5]
    ON [dbo].[tblAssetCustom]([Custom5] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom6]
    ON [dbo].[tblAssetCustom]([Custom6] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom7]
    ON [dbo].[tblAssetCustom]([Custom7] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom8]
    ON [dbo].[tblAssetCustom]([Custom8] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom9]
    ON [dbo].[tblAssetCustom]([Custom9] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom10]
    ON [dbo].[tblAssetCustom]([Custom10] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom11]
    ON [dbo].[tblAssetCustom]([Custom11] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom12]
    ON [dbo].[tblAssetCustom]([Custom12] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom13]
    ON [dbo].[tblAssetCustom]([Custom13] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom14]
    ON [dbo].[tblAssetCustom]([Custom14] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom15]
    ON [dbo].[tblAssetCustom]([Custom15] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom16]
    ON [dbo].[tblAssetCustom]([Custom16] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom17]
    ON [dbo].[tblAssetCustom]([Custom17] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom18]
    ON [dbo].[tblAssetCustom]([Custom18] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom19]
    ON [dbo].[tblAssetCustom]([Custom19] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Custom20]
    ON [dbo].[tblAssetCustom]([Custom20] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_OrderNumber]
    ON [dbo].[tblAssetCustom]([OrderNumber] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_Barcode]
    ON [dbo].[tblAssetCustom]([BarCode] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssetCustom_State]
    ON [dbo].[tblAssetCustom]([State] ASC)
    INCLUDE([AssetID], [Manufacturer]) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE STATISTICS [_dta_stat_2027362487_1_2]
    ON [dbo].[tblAssetCustom]([CustID], [AssetID]);


GO
CREATE STATISTICS [_dta_stat_2027362487_1_3_17]
    ON [dbo].[tblAssetCustom]([CustID], [State], [Manufacturer]);


GO
CREATE STATISTICS [_dta_stat_2027362487_16_2_30_9]
    ON [dbo].[tblAssetCustom]([BarCode], [AssetID], [Serialnumber], [OrderNumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_17_2_1]
    ON [dbo].[tblAssetCustom]([Manufacturer], [AssetID], [CustID]);


GO
CREATE STATISTICS [_dta_stat_2027362487_17_21_2]
    ON [dbo].[tblAssetCustom]([Manufacturer], [Model], [AssetID]);


GO
CREATE STATISTICS [_dta_stat_2027362487_18_2_3]
    ON [dbo].[tblAssetCustom]([ManufacturerLock], [AssetID], [State]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_37_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom3], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_38_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom4], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_39_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom5], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_42_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom8], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_43_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom9], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_46_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom12], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_47_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom13], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_48_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom14], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_5]
    ON [dbo].[tblAssetCustom]([AssetID], [Warrantydate]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_50_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom16], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_52_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom18], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_53_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom19], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_2_54_30]
    ON [dbo].[tblAssetCustom]([AssetID], [Custom20], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_26_21]
    ON [dbo].[tblAssetCustom]([SnmpOID], [Model]);


GO
CREATE STATISTICS [_dta_stat_2027362487_3_2_1_17]
    ON [dbo].[tblAssetCustom]([State], [AssetID], [CustID], [Manufacturer]);


GO
CREATE STATISTICS [_dta_stat_2027362487_3_56_2]
    ON [dbo].[tblAssetCustom]([State], [SSHServer], [AssetID]);


GO
CREATE STATISTICS [_dta_stat_2027362487_30_16_9]
    ON [dbo].[tblAssetCustom]([Serialnumber], [BarCode], [OrderNumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_30_2]
    ON [dbo].[tblAssetCustom]([Serialnumber], [AssetID]);


GO
CREATE STATISTICS [_dta_stat_2027362487_35_2_30]
    ON [dbo].[tblAssetCustom]([Custom1], [AssetID], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_41_2_30]
    ON [dbo].[tblAssetCustom]([Custom7], [AssetID], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_45_2_30]
    ON [dbo].[tblAssetCustom]([Custom11], [AssetID], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_49_2_30]
    ON [dbo].[tblAssetCustom]([Custom15], [AssetID], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_51_2_30]
    ON [dbo].[tblAssetCustom]([Custom17], [AssetID], [Serialnumber]);


GO
CREATE STATISTICS [_dta_stat_2027362487_9_2_30]
    ON [dbo].[tblAssetCustom]([OrderNumber], [AssetID], [Serialnumber]);


GO

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,01/11/2016,>
-- Description:	<Description,Контролирует изменение поля Custom16 и пишет изменения в таблицу rPrintHist для 
-- дальнейшего накопления и использования статистики опечатков принтеров,>
-- =============================================
CREATE TRIGGER [dbo].[Trigger_Update1]
on [dbo].[tblAssetCustom] after UPDATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	-- te
	SET NOCOUNT ON;

 	declare @dt datetime

	select @dt = (select top 1 i.custom15 from inserted as i)

	IF @dt >= GetDate() or @dt < '2016-10-01'
	BEGIN
		select @dt = GetDate()
	END
		
	--set @dt = GetDate()


		
    -- Insert statements for trigger here
	Insert Into dbo.rPrintHist(AssetID, Company, City, Address, Officenr, 
	placenr, datecheck, printedpages)
	select d.AssetID,
	d.Custom1, d.Custom2, d.Custom3, d.Custom4, d.Custom5, 
	@dt, i.Custom16
	from inserted as i
	inner join deleted as d on i.AssetID = d.AssetID
	inner join dbo.tblAssets as a on i.AssetID = a.AssetID
	inner join dbo.tsysAssetTypes as at on a.Assettype = at.AssetType
	where d.Custom16 != i.Custom16 and at.AssetTypename = 'Printer'
END


GO


Create Trigger Trigger_upd
on dbo.tblAssetCustom after UPDATE
AS
if @@ROWCOUNT >=1 
	begin
		insert into dbo.rCustomsLog( AssetID, Custom1_old)
		select d.AssetId, d.Custom20
		from inserted as i
		inner join deleted as d on i.AssetID = d.AssetID
		where i.custom20 <> d.custom20
	end
	

	


GO
DISABLE TRIGGER [dbo].[Trigger_upd]
    ON [dbo].[tblAssetCustom];


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Trigger_Update]
on [dbo].[tblAssetCustom] after UPDATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	Insert Into dbo.rCustomsLog(AssetID, moddate, 
	Custom1_old, Custom2_old, Custom3_old, Custom4_old, Custom5_old, 
	Custom6_old, Custom7_old, Custom8_old, Custom9_old, Custom10_old, 
	Custom11_old, Custom12_old, Custom13_old, Custom14_old, Custom15_old, 
	Custom16_old, Custom17_old, Custom18_old, Custom19_old, Custom20_old, SerialNumber_old, 
	Custom1_new, Custom2_new, Custom3_new, Custom4_new, Custom5_new, 
	Custom6_new, Custom7_new, Custom8_new, Custom9_new, Custom10_new, 
	Custom11_new, Custom12_new, Custom13_new, Custom14_new, Custom15_new, 
	Custom16_new, Custom17_new, Custom18_new, Custom19_new, Custom20_new, SerialNumber_new)
	select d.AssetID, GetDate(),
	d.Custom1, d.Custom2, d.Custom3, d.Custom4, d.Custom5, 
	d.Custom6, d.Custom7, d.Custom8, d.Custom9, d.Custom10, 
	d.Custom11, d.Custom12, d.Custom13, d.Custom14, d.Custom15, 
	d.Custom16, d.Custom17, d.Custom18, d.Custom19, d.Custom20, d.Serialnumber, 
	i.Custom1, i.Custom2, i.Custom3, i.Custom4, i.Custom5, 
	i.Custom6, i.Custom7, i.Custom8, i.Custom9, i.Custom10, 
	i.Custom11, i.Custom12, i.Custom13, i.Custom14, i.Custom15, 
	i.Custom16, i.Custom17, i.Custom18, i.Custom19, i.Custom20, i.Serialnumber
	from inserted as i
	inner join deleted as d on i.AssetID = d.AssetID
	where d.Serialnumber != i.Serialnumber or d.Custom1 != i.Custom1 or d.Custom2 != i.Custom2 or d.Custom3 != i.Custom3 or d.Custom4 != i.Custom4 or d.Custom5 != i.Custom5 or d.Custom6 != i.Custom6 or d.Custom7 != i.Custom7 or d.Custom8 != i.Custom8 or d.Custom9 != i.Custom9 or d.Custom10 != i.Custom10 or d.Custom11 != i.Custom11 or d.Custom12 != i.Custom12 or d.Custom13 != i.Custom13 or d.Custom14 != i.Custom14 or d.Custom15 != i.Custom15 or d.Custom16 != i.Custom16 or d.Custom17 != i.Custom17 or d.Custom18 != i.Custom18 or d.Custom19 != i.Custom19 or d.Custom20 != i.Custom20
END
