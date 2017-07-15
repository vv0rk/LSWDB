CREATE TABLE [dbo].[tblEnvironment] (
    [Win32_Environmentid] INT             IDENTITY (1, 1) NOT NULL,
    [AssetID]             INT             NOT NULL,
    [Caption]             NVARCHAR (450)  NULL,
    [Name]                NVARCHAR (450)  NULL,
    [SystemVariable]      BIT             NULL,
    [UserName]            NVARCHAR (300)  NULL,
    [VariableValue]       NVARCHAR (4000) NULL,
    [Lastchanged]         DATETIME        CONSTRAINT [DF_tblEnvironment_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblEnvironment] PRIMARY KEY CLUSTERED ([Win32_Environmentid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblEnvironment_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblEnvironment_tblAssets]
    ON [dbo].[tblEnvironment]([AssetID] ASC) WITH (FILLFACTOR = 90);

