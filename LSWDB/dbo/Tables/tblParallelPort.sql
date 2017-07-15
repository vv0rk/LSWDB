CREATE TABLE [dbo].[tblParallelPort] (
    [Win32_ParallelPortid]     INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                  INT            NOT NULL,
    [Availability]             NUMERIC (18)   NULL,
    [Caption]                  NVARCHAR (450) NULL,
    [ConfigManagerErrorCode]   NUMERIC (18)   NULL,
    [ConfigManagerUserConfig]  BIT            NULL,
    [OSAutoDiscovered]         BIT            NULL,
    [PowerManagementSupported] BIT            NULL,
    [ProtocolSupported]        NUMERIC (18)   NULL,
    [Lastchanged]              DATETIME       CONSTRAINT [DF_tblParallelPort_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblParallelPort] PRIMARY KEY CLUSTERED ([Win32_ParallelPortid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblParallelPort_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblParallelPort_tblAssets]
    ON [dbo].[tblParallelPort]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

