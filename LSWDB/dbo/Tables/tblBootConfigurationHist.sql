CREATE TABLE [dbo].[tblBootConfigurationHist] (
    [Trackercode]            INT          IDENTITY (1, 1) NOT NULL,
    [AssetID]                INT          NOT NULL,
    [BootConfigurationuniid] INT          NOT NULL,
    [Lastchanged]            DATETIME     CONSTRAINT [DF_tblBootConfigurationhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                 NUMERIC (18) NOT NULL,
    CONSTRAINT [PK_tblBootConfigurationhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblBootConfigurationhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblBootConfigurationhist_tblAssets]
    ON [dbo].[tblBootConfigurationHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

