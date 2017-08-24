CREATE TABLE [dbo].[tblDCOMApplication] (
    [Win32_DCOMApplicationid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT            NOT NULL,
    [Caption]                 NVARCHAR (450) NULL,
    [Lastchanged]             DATETIME       CONSTRAINT [DF_tblDCOMApplication_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblDCOMApplication] PRIMARY KEY CLUSTERED ([Win32_DCOMApplicationid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblDCOMApplication_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblDCOMApplication_tblAssets]
    ON [dbo].[tblDCOMApplication]([AssetID] ASC) WITH (FILLFACTOR = 90);

