CREATE TABLE [dbo].[tblMacDiscBurning] (
    [DiscBurningID]          INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]                INT            NOT NULL,
    [Name]                   NVARCHAR (100) NULL,
    [Firmware]               NVARCHAR (20)  NULL,
    [Interconnect]           NVARCHAR (50)  NULL,
    [BurnSupport]            NVARCHAR (50)  NULL,
    [BurnUnderrunProtection] BIT            NULL,
    [Cache]                  NVARCHAR (20)  NULL,
    [CDWrite]                NVARCHAR (20)  NULL,
    [DVDWrite]               NVARCHAR (50)  NULL,
    [Media]                  BIT            NULL,
    [ReadDVD]                BIT            NULL,
    [WriteStrategies]        NVARCHAR (50)  NULL,
    [LastChanged]            DATETIME       CONSTRAINT [DF_tblMacDiscBurning_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblMacDiscBurning] PRIMARY KEY CLUSTERED ([DiscBurningID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMacDiscBurning_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMacDiscBurning_tblAssets]
    ON [dbo].[tblMacDiscBurning]([AssetID] ASC) WITH (FILLFACTOR = 90);

