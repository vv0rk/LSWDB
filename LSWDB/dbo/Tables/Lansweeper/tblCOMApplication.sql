CREATE TABLE [dbo].[tblCOMApplication] (
    [Win32_COMApplicationid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                INT            NOT NULL,
    [Caption]                NVARCHAR (450) NULL,
    [lastchanged]            DATETIME       CONSTRAINT [DF_tblCOMApplication_lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblCOMApplication] PRIMARY KEY CLUSTERED ([Win32_COMApplicationid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblCOMApplication_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblCOMApplication_tblAssets]
    ON [dbo].[tblCOMApplication]([AssetID] ASC) WITH (FILLFACTOR = 90);

