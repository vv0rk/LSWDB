CREATE TABLE [dbo].[tblNetworkHist] (
    [Trackercode]                  INT             IDENTITY (1, 1) NOT NULL,
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
    [Lastchanged]                  DATETIME        CONSTRAINT [DF_tblNetworkhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                       NUMERIC (18)    NULL,
    CONSTRAINT [PK_tblNetworkhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblNetworkHist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblNetworkHist_tblAssets]
    ON [dbo].[tblNetworkHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

