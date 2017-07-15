CREATE TABLE [dbo].[tblSNMPInfo] (
    [SnmpInfoID]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [AssetID]        INT             NOT NULL,
    [IfIndex]        INT             NULL,
    [IfDescription]  NVARCHAR (255)  NULL,
    [IfType]         NUMERIC (18)    NULL,
    [IfMTU]          NUMERIC (18)    NULL,
    [IfSpeed]        NUMERIC (18)    NULL,
    [IfIPAddress]    VARCHAR (50)    NULL,
    [IfMask]         VARCHAR (50)    NULL,
    [IfMacaddress]   VARCHAR (50)    NULL,
    [IfAdminstatus]  INT             NULL,
    [IfOperstatus]   INT             NULL,
    [Lastchanged]    DATETIME        CONSTRAINT [DF_tblSNMPInfo_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Uplink]         BIT             CONSTRAINT [DF_tblSNMPInfo_Uplink] DEFAULT ((0)) NOT NULL,
    [Portname]       NVARCHAR (50)   NULL,
    [Vlan]           NVARCHAR (2048) NULL,
    [ifName]         NVARCHAR (255)  NULL,
    [ifAlias]        NVARCHAR (255)  NULL,
    [DefaultGateway] NVARCHAR (50)   NULL,
    CONSTRAINT [PK_tblSNMPInfo] PRIMARY KEY CLUSTERED ([SnmpInfoID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblSNMPInfo_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IX_tblSNMPInfo]
    ON [dbo].[tblSNMPInfo]([AssetID] ASC, [IfIndex] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

