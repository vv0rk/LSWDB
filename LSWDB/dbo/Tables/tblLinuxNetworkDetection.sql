CREATE TABLE [dbo].[tblLinuxNetworkDetection] (
    [NetworkID]   INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Name]        NVARCHAR (200) NULL,
    [LinkEncap]   NVARCHAR (200) NULL,
    [Mac]         NVARCHAR (200) NULL,
    [Ipv4]        NVARCHAR (200) NULL,
    [Ipv6]        NVARCHAR (200) NULL,
    [Broadcast]   NVARCHAR (200) NULL,
    [Subnetmask]  NVARCHAR (200) NULL,
    [Scope]       NVARCHAR (200) NULL,
    [LastChanged] DATETIME       CONSTRAINT [DF_tblLinuxNetworkDetection_LastChanged] DEFAULT (getdate()) NOT NULL,
    [Gateway]     NVARCHAR (200) NULL,
    CONSTRAINT [PK_tblLinuxNetworkDetection] PRIMARY KEY CLUSTERED ([NetworkID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblLinuxNetworkDetection_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblLinuxNetworkDetection_tblAssets]
    ON [dbo].[tblLinuxNetworkDetection]([AssetID] ASC) WITH (FILLFACTOR = 90);

