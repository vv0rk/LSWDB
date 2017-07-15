CREATE TABLE [dbo].[tblPortConnectorHist] (
    [Trackercode]                 INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                     INT            NOT NULL,
    [ConnectorType]               VARCHAR (100)  NULL,
    [ExternalReferenceDesignator] NVARCHAR (450) NULL,
    [InternalReferenceDesignator] NVARCHAR (450) NULL,
    [PortType]                    NUMERIC (18)   NULL,
    [Lastchanged]                 DATETIME       CONSTRAINT [DF_tblPortConnectorhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                      NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblPortConnectorhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblPortConnectorhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPortConnectorhist_tblAssets]
    ON [dbo].[tblPortConnectorHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

