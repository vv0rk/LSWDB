CREATE TABLE [dbo].[tblAssets] (
    [AssetID]           INT            IDENTITY (1, 1) NOT NULL,
    [AssetUnique]       NVARCHAR (150) NULL,
    [Domain]            NVARCHAR (150) NULL,
    [Username]          NVARCHAR (150) NULL,
    [Userdomain]        NVARCHAR (150) NULL,
    [FQDN]              NVARCHAR (512) NULL,
    [IPAddress]         VARCHAR (100)  NULL,
    [IPNumeric]         NUMERIC (18)   NULL,
    [SiteID]            NUMERIC (18)   NULL,
    [Scanserver]        NVARCHAR (150) NULL,
    [OScode]            VARCHAR (20)   NULL,
    [SP]                NUMERIC (18)   NULL,
    [Description]       NVARCHAR (500) NULL,
    [Descriptionlock]   BIT            NULL,
    [Assettype]         INT            CONSTRAINT [DF_tblAssets_ItemType] DEFAULT ((-1)) NOT NULL,
    [AssetTypeLock]     BIT            NULL,
    [AssetName]         NVARCHAR (200) NOT NULL,
    [AssetNameLock]     BIT            NULL,
    [Mac]               VARCHAR (20)   NULL,
    [Firstseen]         DATETIME       CONSTRAINT [DF_tblAssets_Firtseen] DEFAULT (getdate()) NULL,
    [Lastseen]          DATETIME       CONSTRAINT [DF_tblAssets_Lastseen] DEFAULT (getdate()) NULL,
    [Lasttried]         DATETIME       NULL,
    [Lasttriggered]     DATETIME       NULL,
    [LastScheduled]     DATETIME       NULL,
    [LastActiveScan]    DATETIME       NULL,
    [LastIPScan]        DATETIME       NULL,
    [LastLsPush]        DATETIME       NULL,
    [LastSaved]         DATETIME       NULL,
    [Uptime]            NUMERIC (18)   NULL,
    [Memory]            NUMERIC (18)   NULL,
    [NrProcessors]      NUMERIC (18)   NULL,
    [Processor]         NVARCHAR (255) NULL,
    [ServiceVersion]    NVARCHAR (50)  NULL,
    [LsPushVersion]     NVARCHAR (50)  NULL,
    [lastWorkgroupScan] DATETIME       NULL,
    [LocationID]        INT            DEFAULT ((-1)) NOT NULL,
    [ManualMAC]         BIT            DEFAULT ((0)) NOT NULL,
    [LastChanged]       DATETIME       DEFAULT (getdate()) NOT NULL,
    [LastLsFallBack]    DATETIME       NULL,
    CONSTRAINT [PK_tblAssets] PRIMARY KEY CLUSTERED ([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblAssets_tsysAssetTypes] FOREIGN KEY ([Assettype]) REFERENCES [dbo].[tsysAssetTypes] ([AssetType]) NOT FOR REPLICATION,
    CONSTRAINT [FK_tblAssets_tsysIPLocations] FOREIGN KEY ([LocationID]) REFERENCES [dbo].[tsysIPLocations] ([LocationID])
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_5_422500784__K11_K1_K2_K17]
    ON [dbo].[tblAssets]([OScode] ASC, [AssetID] ASC, [AssetUnique] ASC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_5_422500784__K11_K15_1_7_17_21_22]
    ON [dbo].[tblAssets]([OScode] ASC, [Assettype] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_5_422500784__K15_K8_K1]
    ON [dbo].[tblAssets]([Assettype] ASC, [IPNumeric] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_5_422500784__K17_K7_1_13_15]
    ON [dbo].[tblAssets]([AssetName] ASC, [IPAddress] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_5_422500784__K17_K7_K1_3_6_13_15]
    ON [dbo].[tblAssets]([AssetName] ASC, [IPAddress] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_5_422500784__K17_K7_K1_6]
    ON [dbo].[tblAssets]([AssetName] ASC, [IPAddress] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_5_422500784__K19_K1]
    ON [dbo].[tblAssets]([Mac] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_5_422500784__K3_K17_K7_K1]
    ON [dbo].[tblAssets]([Domain] ASC, [AssetName] ASC, [IPAddress] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K1_8]
    ON [dbo].[tblAssets]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K1_K11]
    ON [dbo].[tblAssets]([AssetID] ASC, [OScode] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K1_K11_K17]
    ON [dbo].[tblAssets]([AssetID] ASC, [OScode] ASC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K1_K11_K3_K21]
    ON [dbo].[tblAssets]([AssetID] ASC, [OScode] ASC, [Domain] ASC, [Lastseen] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K1_K15_K3]
    ON [dbo].[tblAssets]([AssetID] ASC, [Assettype] ASC, [Domain] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K1_K17]
    ON [dbo].[tblAssets]([AssetID] ASC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K1_K17_11]
    ON [dbo].[tblAssets]([AssetID] ASC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K1_K8_K15_3_7_11_17_21]
    ON [dbo].[tblAssets]([AssetID] ASC, [IPNumeric] ASC, [Assettype] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K11_K1_13_17]
    ON [dbo].[tblAssets]([OScode] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K11_K1_K12_K17]
    ON [dbo].[tblAssets]([OScode] ASC, [AssetID] ASC, [SP] ASC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K11_K1_K17]
    ON [dbo].[tblAssets]([OScode] ASC, [AssetID] ASC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K11_K1_K2]
    ON [dbo].[tblAssets]([OScode] ASC, [AssetID] ASC, [AssetUnique] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K11_K8_K1_K7]
    ON [dbo].[tblAssets]([OScode] ASC, [IPNumeric] ASC, [AssetID] ASC, [IPAddress] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K12_K11_K1_K17]
    ON [dbo].[tblAssets]([SP] ASC, [OScode] ASC, [AssetID] ASC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K15_11_12]
    ON [dbo].[tblAssets]([Assettype] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K15_K1]
    ON [dbo].[tblAssets]([Assettype] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K15_K1_K17]
    ON [dbo].[tblAssets]([Assettype] ASC, [AssetID] ASC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K15_K1_K17_20_21]
    ON [dbo].[tblAssets]([Assettype] ASC, [AssetID] ASC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K15_K1_K3]
    ON [dbo].[tblAssets]([Assettype] ASC, [AssetID] ASC, [Domain] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K15_K3_K11_K1_K17_2_7_12_13_21_29_30_31]
    ON [dbo].[tblAssets]([Assettype] ASC, [Domain] ASC, [OScode] ASC, [AssetID] ASC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K17_1_15]
    ON [dbo].[tblAssets]([AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K17_K1_7_11_12_15_20_21_22_29_30]
    ON [dbo].[tblAssets]([AssetName] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K17_K2_1_11]
    ON [dbo].[tblAssets]([AssetName] ASC, [AssetUnique] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K20D_K17_1_11]
    ON [dbo].[tblAssets]([Firstseen] DESC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K21D_1_4_5_11_17]
    ON [dbo].[tblAssets]([Lastseen] DESC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K21D_K17_1_11]
    ON [dbo].[tblAssets]([Lastseen] DESC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K29_K1_K11_K17]
    ON [dbo].[tblAssets]([Memory] ASC, [AssetID] ASC, [OScode] ASC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K3_K11_K1]
    ON [dbo].[tblAssets]([Domain] ASC, [OScode] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K3_K15_1_11_21]
    ON [dbo].[tblAssets]([Domain] ASC, [Assettype] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K30D_K17_1_11]
    ON [dbo].[tblAssets]([NrProcessors] DESC, [AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_7_255548194__K8_1_15]
    ON [dbo].[tblAssets]([IPNumeric] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblAssets]
    ON [dbo].[tblAssets]([AssetUnique] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssets_1]
    ON [dbo].[tblAssets]([Domain] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssets_Description]
    ON [dbo].[tblAssets]([Description] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssets_IPAddress]
    ON [dbo].[tblAssets]([IPAddress] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_6_422500784__K4_K5_1_3_6_7_13_15_17]
    ON [dbo].[tblAssets]([Username] ASC, [Userdomain] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblAssets_6_422500784__K17_1_7_13_15]
    ON [dbo].[tblAssets]([AssetName] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblAssets_tsysIPLocations]
    ON [dbo].[tblAssets]([LocationID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblassets_Assettype]
    ON [dbo].[tblAssets]([Assettype] ASC)
    INCLUDE([AssetID], [IPAddress], [OScode], [AssetName], [Lastseen], [Lasttried]) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IX_tblassets_IPAddress_Assettype]
    ON [dbo].[tblAssets]([IPAddress] ASC, [Assettype] ASC)
    INCLUDE([AssetID], [AssetUnique], [Mac]) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE STATISTICS [_dta_stat_422500784_1_11_31]
    ON [dbo].[tblAssets]([AssetID], [OScode], [NrProcessors]);


GO
CREATE STATISTICS [_dta_stat_422500784_1_15_19]
    ON [dbo].[tblAssets]([AssetID], [Assettype], [Mac]);


GO
CREATE STATISTICS [_dta_stat_422500784_1_15_4]
    ON [dbo].[tblAssets]([AssetID], [Assettype], [Username]);


GO
CREATE STATISTICS [_dta_stat_422500784_1_19]
    ON [dbo].[tblAssets]([AssetID], [Mac]);


GO
CREATE STATISTICS [_dta_stat_422500784_1_20_11]
    ON [dbo].[tblAssets]([AssetID], [Firstseen], [OScode]);


GO
CREATE STATISTICS [_dta_stat_422500784_1_21_11]
    ON [dbo].[tblAssets]([AssetID], [Lastseen], [OScode]);


GO
CREATE STATISTICS [_dta_stat_422500784_1_4_5_15]
    ON [dbo].[tblAssets]([AssetID], [Username], [Userdomain], [Assettype]);


GO
CREATE STATISTICS [_dta_stat_422500784_1_8_15_4_5]
    ON [dbo].[tblAssets]([AssetID], [IPNumeric], [Assettype], [Username], [Userdomain]);


GO
CREATE STATISTICS [_dta_stat_422500784_11_31]
    ON [dbo].[tblAssets]([OScode], [NrProcessors]);


GO
CREATE STATISTICS [_dta_stat_422500784_11_4]
    ON [dbo].[tblAssets]([OScode], [Username]);


GO
CREATE STATISTICS [_dta_stat_422500784_11_7]
    ON [dbo].[tblAssets]([OScode], [IPAddress]);


GO
CREATE STATISTICS [_dta_stat_422500784_14_1]
    ON [dbo].[tblAssets]([Descriptionlock], [AssetID]);


GO
CREATE STATISTICS [_dta_stat_422500784_15_17]
    ON [dbo].[tblAssets]([Assettype], [AssetName]);


GO
CREATE STATISTICS [_dta_stat_422500784_15_3_17]
    ON [dbo].[tblAssets]([Assettype], [Domain], [AssetName]);


GO
CREATE STATISTICS [_dta_stat_422500784_15_4_5]
    ON [dbo].[tblAssets]([Assettype], [Username], [Userdomain]);


GO
CREATE STATISTICS [_dta_stat_422500784_15_8_4_5]
    ON [dbo].[tblAssets]([Assettype], [IPNumeric], [Username], [Userdomain]);


GO
CREATE STATISTICS [_dta_stat_422500784_17_11]
    ON [dbo].[tblAssets]([AssetName], [OScode]);


GO
CREATE STATISTICS [_dta_stat_422500784_17_3_7]
    ON [dbo].[tblAssets]([AssetName], [Domain], [IPAddress]);


GO
CREATE STATISTICS [_dta_stat_422500784_2_11]
    ON [dbo].[tblAssets]([AssetUnique], [OScode]);


GO
CREATE STATISTICS [_dta_stat_422500784_20_11]
    ON [dbo].[tblAssets]([Firstseen], [OScode]);


GO
CREATE STATISTICS [_dta_stat_422500784_21_11]
    ON [dbo].[tblAssets]([Lastseen], [OScode]);


GO
CREATE STATISTICS [_dta_stat_422500784_3_1_17_15]
    ON [dbo].[tblAssets]([Domain], [AssetID], [AssetName], [Assettype]);


GO
CREATE STATISTICS [_dta_stat_422500784_3_21_1]
    ON [dbo].[tblAssets]([Domain], [Lastseen], [AssetID]);


GO
CREATE STATISTICS [_dta_stat_422500784_31_1]
    ON [dbo].[tblAssets]([NrProcessors], [AssetID]);


GO
CREATE STATISTICS [_dta_stat_422500784_4_5_11]
    ON [dbo].[tblAssets]([Username], [Userdomain], [OScode]);


GO
CREATE STATISTICS [_dta_stat_422500784_7_1_8]
    ON [dbo].[tblAssets]([IPAddress], [AssetID], [IPNumeric]);


GO
CREATE STATISTICS [_dta_stat_422500784_7_17_15_3_1]
    ON [dbo].[tblAssets]([IPAddress], [AssetName], [Assettype], [Domain], [AssetID]);


GO

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,25/02/2017,>
/* Description:	<проверяет назначен ли AssetId к какому либо устройству из rActiveCategory1
				 если назначен, то удаление запрещено>
*/
-- =============================================
CREATE TRIGGER Trigger_tblAssets_rActiveCategory1
on [dbo].[tblAssets] FOR DELETE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF EXISTS (
				select * 
				from deleted as a
				inner join dbo.rActiveCategory1 as ac on a.AssetID = ac.AssetId
				)
	BEGIN
		RAISERROR (N'Этот Ассет связан с устройством rActiveCategory1 и запрещен к удалению',10,1)
		ROLLBACK TRANSACTION
	END


END

