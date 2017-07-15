CREATE TABLE [dbo].[tblMacFireWires] (
    [FireWireID]  INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]     INT           NOT NULL,
    [Name]        NVARCHAR (50) NULL,
    [MaxSpeed]    NVARCHAR (50) NULL,
    [LastChanged] DATETIME      CONSTRAINT [DF_tblMacFireWires_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblMacFireWires] PRIMARY KEY CLUSTERED ([FireWireID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMacFireWires_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMacFireWires_tblAssets]
    ON [dbo].[tblMacFireWires]([AssetID] ASC) WITH (FILLFACTOR = 90);

