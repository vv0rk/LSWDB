CREATE TABLE [dbo].[tblOnBoardDeviceHist] (
    [Trackercode] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT            NOT NULL,
    [Description] NVARCHAR (450) NULL,
    [DeviceType]  NUMERIC (18)   NULL,
    [Enabled]     BIT            NULL,
    [Tag]         NVARCHAR (450) NULL,
    [Lastchanged] DATETIME       CONSTRAINT [DF_tblOnBoardDevicehist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]      NUMERIC (18)   NULL,
    CONSTRAINT [PK_tblOnBoardDevicehist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblOnBoardDevicehist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblOnBoardDevicehist_tblAssets]
    ON [dbo].[tblOnBoardDeviceHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

