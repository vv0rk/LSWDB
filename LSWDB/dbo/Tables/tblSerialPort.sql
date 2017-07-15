CREATE TABLE [dbo].[tblSerialPort] (
    [Win32_SerialPortid]      INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                 INT            NOT NULL,
    [Availability]            NUMERIC (18)   NULL,
    [Binary]                  BIT            NULL,
    [DeviceID]                NVARCHAR (200) NULL,
    [MaxBaudRate]             NUMERIC (18)   NULL,
    [MaximumInputBufferSize]  NUMERIC (18)   NULL,
    [MaximumOutputBufferSize] NUMERIC (18)   NULL,
    [OSAutoDiscovered]        BIT            NULL,
    [ProviderType]            NVARCHAR (50)  NULL,
    [Lastchanged]             DATETIME       CONSTRAINT [DF_tblSerialPort_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblSerialPort] PRIMARY KEY CLUSTERED ([Win32_SerialPortid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblSerialPort_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblSerialPort_tblAssets]
    ON [dbo].[tblSerialPort]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

