CREATE TABLE [dbo].[tblPCMCIAController] (
    [Win32_PCMCIAControllerid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                  INT            NOT NULL,
    [Caption]                  NVARCHAR (450) NULL,
    [ConfigManagerErrorCode]   NUMERIC (18)   NULL,
    [ConfigManagerUserConfig]  BIT            NULL,
    [Manufacturer]             NVARCHAR (450) NULL,
    [ProtocolSupported]        NUMERIC (18)   NULL,
    [Lastchanged]              DATETIME       CONSTRAINT [DF_tblPCMCIAController_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblPCMCIAController] PRIMARY KEY CLUSTERED ([Win32_PCMCIAControllerid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblPCMCIAController_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblPCMCIAController_tblAssets]
    ON [dbo].[tblPCMCIAController]([AssetID] ASC) WITH (FILLFACTOR = 90);

