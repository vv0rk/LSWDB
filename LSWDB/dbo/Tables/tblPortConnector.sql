CREATE TABLE [dbo].[tblPortConnector] (
    [Win32_PortConnectorid]       INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                     INT            NOT NULL,
    [ConnectorType]               VARCHAR (100)  NULL,
    [ExternalReferenceDesignator] NVARCHAR (450) NULL,
    [InternalReferenceDesignator] NVARCHAR (450) NULL,
    [PortType]                    NUMERIC (18)   NULL,
    [Lastchanged]                 DATETIME       CONSTRAINT [DF_tblPortConnector_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblPortConnector] PRIMARY KEY CLUSTERED ([Win32_PortConnectorid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblPortConnector_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPortConnector_tblAssets]
    ON [dbo].[tblPortConnector]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

