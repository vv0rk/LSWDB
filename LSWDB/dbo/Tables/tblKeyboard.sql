CREATE TABLE [dbo].[tblKeyboard] (
    [Win32_Keyboardid]        INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT            NOT NULL,
    [ConfigManagerErrorCode]  NUMERIC (18)   NULL,
    [ConfigManagerUserConfig] BIT            NULL,
    [Description]             NVARCHAR (450) NULL,
    [Layout]                  NVARCHAR (50)  NULL,
    [NumberOfFunctionKeys]    NUMERIC (18)   NULL,
    [Lastchanged]             DATETIME       CONSTRAINT [DF_tblKeyboard_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblKeyboard] PRIMARY KEY CLUSTERED ([Win32_Keyboardid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblKeyboard_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblKeyboard_tblAssets]
    ON [dbo].[tblKeyboard]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

