CREATE TABLE [dbo].[tblDisplayConfiguration] (
    [Win32_DisplayConfigurationid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                      INT            NOT NULL,
    [BitsPerPel]                   NUMERIC (18)   NULL,
    [Caption]                      NVARCHAR (450) NULL,
    [DisplayFlags]                 NUMERIC (18)   NULL,
    [DisplayFrequency]             NUMERIC (18)   NULL,
    [DriverVersion]                NVARCHAR (450) NULL,
    [LogPixels]                    NUMERIC (18)   NULL,
    [PelsHeight]                   NUMERIC (18)   NULL,
    [PelsWidth]                    NUMERIC (18)   NULL,
    [SpecificationVersion]         NUMERIC (18)   NULL,
    [lastchanged]                  DATETIME       CONSTRAINT [DF_tblDisplayConfiguration_lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblDisplayConfiguration] PRIMARY KEY CLUSTERED ([Win32_DisplayConfigurationid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblDisplayConfiguration_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblDisplayConfiguration_tblAssets]
    ON [dbo].[tblDisplayConfiguration]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

