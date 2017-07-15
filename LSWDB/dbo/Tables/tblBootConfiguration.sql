CREATE TABLE [dbo].[tblBootConfiguration] (
    [Win32_BootConfigurationid] INT      IDENTITY (1, 1) NOT NULL,
    [AssetID]                   INT      NOT NULL,
    [BootConfigurationuniid]    INT      NOT NULL,
    [Lastchanged]               DATETIME CONSTRAINT [DF_tblBootConfiguration_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblBootConfiguration] PRIMARY KEY CLUSTERED ([Win32_BootConfigurationid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblBootConfiguration_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE,
    CONSTRAINT [FK_tblBootConfiguration_tblBootConfigurationUni] FOREIGN KEY ([BootConfigurationuniid]) REFERENCES [dbo].[tblBootConfigurationUni] ([BootConfigurationuniid]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblBootConfiguration_tblAssets]
    ON [dbo].[tblBootConfiguration]([AssetID] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblBootConfiguration_tblBootConfigurationUni]
    ON [dbo].[tblBootConfiguration]([BootConfigurationuniid] ASC) WITH (FILLFACTOR = 90);

