CREATE TABLE [dbo].[tblDesktop] (
    [Win32_Desktopid]       INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]               INT            NOT NULL,
    [BorderWidth]           NUMERIC (18)   NULL,
    [CoolSwitch]            BIT            NULL,
    [CursorBlinkRate]       NUMERIC (18)   NULL,
    [DragFullWindows]       BIT            NULL,
    [GridGranularity]       NUMERIC (18)   NULL,
    [IconSpacing]           NUMERIC (18)   NULL,
    [IconTitleFaceName]     NVARCHAR (300) NULL,
    [IconTitleSize]         NUMERIC (18)   NULL,
    [IconTitleWrap]         BIT            NULL,
    [Name]                  NVARCHAR (450) NULL,
    [Pattern]               NVARCHAR (450) NULL,
    [ScreenSaverActive]     BIT            NULL,
    [ScreenSaverExecutable] NVARCHAR (450) NULL,
    [ScreenSaverSecure]     BIT            NULL,
    [ScreenSaverTimeout]    NUMERIC (18)   NULL,
    [Wallpaper]             NVARCHAR (450) NULL,
    [WallpaperStretched]    BIT            NULL,
    [WallpaperTiled]        BIT            NULL,
    [Lastchanged]           DATETIME       CONSTRAINT [DF_tblDesktop_Lastchanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK__tblDesktop] PRIMARY KEY CLUSTERED ([Win32_Desktopid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblDesktop_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblDesktop_7_89259573__K16_K2_8066]
    ON [dbo].[tblDesktop]([ScreenSaverSecure] ASC, [AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblDesktop_tblAssets]
    ON [dbo].[tblDesktop]([AssetID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

