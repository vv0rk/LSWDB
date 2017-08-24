CREATE TABLE [dbo].[tblMacModems] (
    [ModemID]       INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT           NOT NULL,
    [Model]         NVARCHAR (50) NULL,
    [InterfaceType] NVARCHAR (20) NULL,
    [Modulation]    NVARCHAR (20) NULL,
    [HwVersion]     NVARCHAR (20) NULL,
    [DriverInfo]    NVARCHAR (50) NULL,
    [CountryInfo]   NVARCHAR (50) NULL,
    [LastChanged]   DATETIME      CONSTRAINT [DF_tblMacModems_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblMacModems] PRIMARY KEY CLUSTERED ([ModemID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMacModems_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMacModems_tblAssets]
    ON [dbo].[tblMacModems]([AssetID] ASC) WITH (FILLFACTOR = 90);

