CREATE TABLE [dbo].[tblSerialPortHist] (
    [Trackercode]             INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT            NOT NULL,
    [Availability]            NUMERIC (18)   NULL,
    [Binary]                  BIT            NULL,
    [DeviceID]                NVARCHAR (200) NULL,
    [MaxBaudRate]             NUMERIC (18)   NULL,
    [MaximumInputBufferSize]  NUMERIC (18)   NULL,
    [MaximumOutputBufferSize] NUMERIC (18)   NULL,
    [OSAutoDiscovered]        BIT            NULL,
    [ProviderType]            NVARCHAR (50)  NULL,
    [Lastchanged]             DATETIME       CONSTRAINT [DF_tblSerialPorthist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]                  NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblSerialPorthist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblSerialPorthist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblSerialPorthist_tblAssets]
    ON [dbo].[tblSerialPortHist]([AssetID] ASC) WITH (FILLFACTOR = 90);

