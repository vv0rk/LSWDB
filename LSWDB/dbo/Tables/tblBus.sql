CREATE TABLE [dbo].[tblBus] (
    [Win32_Busid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [BusNum]      NUMERIC (18)   NULL,
    [BusType]     NUMERIC (18)   NULL,
    [DeviceID]    NVARCHAR (450) NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblBus_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblBus] PRIMARY KEY CLUSTERED ([Win32_Busid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblBus_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblBus_tblAssets]
    ON [dbo].[tblBus]([AssetID] ASC) WITH (FILLFACTOR = 90);

