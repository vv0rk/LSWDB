CREATE TABLE [dbo].[tblDisplayConfigurationHist] (
    [Trackercode]          INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]              INT            NOT NULL,
    [BitsPerPel]           NUMERIC (18)   NULL,
    [Caption]              NVARCHAR (450) NULL,
    [DisplayFlags]         NUMERIC (18)   NULL,
    [DisplayFrequency]     NUMERIC (18)   NULL,
    [DriverVersion]        NVARCHAR (450) NULL,
    [LogPixels]            NUMERIC (18)   NULL,
    [PelsHeight]           NUMERIC (18)   NULL,
    [PelsWidth]            NUMERIC (18)   NULL,
    [SpecificationVersion] NUMERIC (18)   NULL,
    [lastchanged]          DATETIME       CONSTRAINT [DF_tblDisplayConfigurationhist_lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]               NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblDisplayConfigurationhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblDisplayConfigurationhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblDisplayConfigurationhist_tblAssets]
    ON [dbo].[tblDisplayConfigurationHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

