CREATE TABLE [dbo].[tblBusHist] (
    [Trackercode] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [BusNum]      NUMERIC (18)   NULL,
    [BusType]     NUMERIC (18)   NULL,
    [DeviceID]    NVARCHAR (450) NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblBushist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblBushist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblBushist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblBushist_tblAssets]
    ON [dbo].[tblBusHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

