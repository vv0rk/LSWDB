CREATE TABLE [dbo].[tblNetwork] (
    [NetworkID]                    INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]                      INT             NOT NULL,
    [Databasepath]                 NVARCHAR (500)  NULL,
    [DefaultIPGateway]             NVARCHAR (500)  NULL,
    [Description]                  NVARCHAR (450)  NULL,
    [DHCPenabled]                  BIT             NULL,
    [DHCPserver]                   NVARCHAR (50)   NULL,
    [DNSDomain]                    NVARCHAR (450)  NULL,
    [DNSDomainSuffixSearchOrder]   NVARCHAR (1000) NULL,
    [DNSEnabledForWinsResolution]  BIT             NULL,
    [DNSHostname]                  NVARCHAR (300)  NULL,
    [DNSServerSearchOrder]         NVARCHAR (500)  NULL,
    [DomainDNSRegistrationEnabled] BIT             NULL,
    [FullDNSRegistrationEnabled]   BIT             NULL,
    [GatewayCostMetric]            NVARCHAR (500)  NULL,
    [IPAddress]                    NVARCHAR (500)  NULL,
    [IPConnectionMetric]           NUMERIC (18)    NULL,
    [IPEnabled]                    BIT             NULL,
    [IPFiltersecurityEnabled]      BIT             NULL,
    [IPPortSecurityEnabled]        BIT             NULL,
    [IPSecPermitIPProtocols]       NVARCHAR (200)  NULL,
    [IPSecPermitTCPPorts]          NVARCHAR (200)  NULL,
    [IPSubnet]                     VARCHAR (500)   NULL,
    [MACaddress]                   VARCHAR (20)    NULL,
    [ServiceName]                  NVARCHAR (900)  NULL,
    [TcpipNetbiosOptions]          NUMERIC (18)    NULL,
    [WINSEnableLMHostsLookup]      BIT             NULL,
    [WINSPrimaryserver]            NVARCHAR (50)   NULL,
    [WINSScopeID]                  NVARCHAR (50)   NULL,
    [WINSSecondaryserver]          NVARCHAR (50)   NULL,
    [Lastchanged]                  DATETIME        CONSTRAINT [DF_tblNetwork_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblNetwork] PRIMARY KEY CLUSTERED ([NetworkID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblNetwork_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblNetwork_5_1779029619__K24_K2_5]
    ON [dbo].[tblNetwork]([MACaddress] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblNetwork_5_1779029619__K24_K2_K18_1_5_16_25]
    ON [dbo].[tblNetwork]([MACaddress] ASC, [AssetID] ASC, [IPEnabled] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblNetwork_7_2032218490__K18_2_12_16_9987]
    ON [dbo].[tblNetwork]([IPEnabled] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblNetwork_7_2032218490__K18_K2_K1_K24_4_5_16_23_5201]
    ON [dbo].[tblNetwork]([IPEnabled] ASC, [AssetID] ASC, [NetworkID] ASC, [MACaddress] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblNetwork_7_2032218490__K2_3_4364]
    ON [dbo].[tblNetwork]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblNetwork_7_2032218490__K6_K18_2_16_9987]
    ON [dbo].[tblNetwork]([DHCPenabled] ASC, [IPEnabled] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblNetwork_7_235968017__K18_K24_K2]
    ON [dbo].[tblNetwork]([IPEnabled] ASC, [MACaddress] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

