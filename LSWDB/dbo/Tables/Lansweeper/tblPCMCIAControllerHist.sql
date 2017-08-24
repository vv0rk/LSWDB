CREATE TABLE [dbo].[tblPCMCIAControllerHist] (
    [Trackercode]             INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT            NOT NULL,
    [Caption]                 NVARCHAR (450) NULL,
    [ConfigManagerErrorCode]  NUMERIC (18)   NULL,
    [ConfigManagerUserConfig] BIT            NULL,
    [Manufacturer]            NVARCHAR (450) NULL,
    [ProtocolSupported]       NUMERIC (18)   NULL,
    [Lastchanged]             DATETIME       CONSTRAINT [DF_tblPCMCIAControllerhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                  NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblPCMCIAControllerhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblPCMCIAControllerhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPCMCIAControllerhist_tblAssets]
    ON [dbo].[tblPCMCIAControllerHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

