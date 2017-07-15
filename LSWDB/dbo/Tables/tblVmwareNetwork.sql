CREATE TABLE [dbo].[tblVmwareNetwork] (
    [NetworkID]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Name]        NVARCHAR (255) NULL,
    [MAC]         VARCHAR (50)   NULL,
    [IPAddress]   NVARCHAR (50)  NULL,
    [Subnet]      NVARCHAR (50)  NULL,
    [lastchanged] DATETIME       CONSTRAINT [DF_tblVmwareNetwork_lastchanged] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_tblVmwareNetwork] PRIMARY KEY CLUSTERED ([NetworkID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblVmwareNetwork_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblVmwareNetwork_tblAssets]
    ON [dbo].[tblVmwareNetwork]([AssetID] ASC) WITH (FILLFACTOR = 90);

