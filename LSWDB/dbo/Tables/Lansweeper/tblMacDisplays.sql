CREATE TABLE [dbo].[tblMacDisplays] (
    [DisplayID]     INT           IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT           NOT NULL,
    [Name]          NVARCHAR (50) NULL,
    [DeviceType]    NVARCHAR (50) NULL,
    [DisplayType]   NVARCHAR (50) NULL,
    [BuiltIn]       BIT           NULL,
    [Depth]         NVARCHAR (50) NULL,
    [Main]          BIT           NULL,
    [Mirror]        NVARCHAR (20) NULL,
    [Online]        BIT           NULL,
    [Resolution]    NVARCHAR (50) NULL,
    [CoreImage]     NVARCHAR (50) NULL,
    [QuartzExtreme] NVARCHAR (50) NULL,
    [LastChanged]   DATETIME      CONSTRAINT [DF_tblMacDisplays_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblMacDisplays] PRIMARY KEY CLUSTERED ([DisplayID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblMacDisplays_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblMacDisplays_tblAssets]
    ON [dbo].[tblMacDisplays]([AssetID] ASC) WITH (FILLFACTOR = 90);

