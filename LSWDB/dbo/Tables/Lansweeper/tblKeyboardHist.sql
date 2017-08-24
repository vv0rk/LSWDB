CREATE TABLE [dbo].[tblKeyboardHist] (
    [Trackercode]             INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT            NOT NULL,
    [ConfigManagerErrorCode]  NUMERIC (18)   NULL,
    [ConfigManagerUserConfig] BIT            NULL,
    [Description]             NVARCHAR (450) NULL,
    [Layout]                  NVARCHAR (50)  NULL,
    [NumberOfFunctionKeys]    NUMERIC (18)   NULL,
    [Lastchanged]             DATETIME       CONSTRAINT [DF_tblKeyboardhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                  NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblKeyboardhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblKeyboardhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblKeyboardhist_tblAssets]
    ON [dbo].[tblKeyboardHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

