CREATE TABLE [dbo].[tblOnBoardDevice] (
    [Win32_OnBoardDeviceid] INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]               INT            NOT NULL,
    [Description]           NVARCHAR (450) NULL,
    [DeviceType]            NUMERIC (18)   NULL,
    [Enabled]               BIT            NULL,
    [Tag]                   NVARCHAR (450) NULL,
    [Lastchanged]           DATETIME       CONSTRAINT [DF_tblOnBoardDevice_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblOnBoardDevice] PRIMARY KEY CLUSTERED ([Win32_OnBoardDeviceid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblOnBoardDevice_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblOnBoardDevice_tblAssets]
    ON [dbo].[tblOnBoardDevice]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

