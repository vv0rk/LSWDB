CREATE TABLE [dbo].[tblTPM] (
    [Win32_TpmId]                 INT           IDENTITY (1, 1) NOT NULL,
    [AssetId]                     INT           NOT NULL,
    [IsActivated_InitialValue]    BIT           NULL,
    [IsEnabled_InitialValue]      BIT           NULL,
    [IsOwned_InitialValue]        BIT           NULL,
    [SpecVersion]                 NVARCHAR (50) NULL,
    [ManufacturerVersion]         NVARCHAR (50) NULL,
    [ManufacturerVersionInfo]     NVARCHAR (50) NULL,
    [ManufacturerId]              INT           NULL,
    [PhysicalPresenceVersionInfo] NVARCHAR (50) NULL,
    [LastChanged]                 DATETIME      CONSTRAINT [DF_tblTPM_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblTPM] PRIMARY KEY CLUSTERED ([Win32_TpmId] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblTPM_tblAssets] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tblTPM_tblAssets]
    ON [dbo].[tblTPM]([AssetId] ASC) WITH (FILLFACTOR = 90);

