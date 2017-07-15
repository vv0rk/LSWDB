CREATE TABLE [dbo].[tblQuickFixEngineeringHist] (
    [Trackercode]   INT            IDENTITY (1, 1) NOT NULL,
    [AssetID]       INT            NOT NULL,
    [QFEID]         INT            NULL,
    [InstalledByID] INT            NULL,
    [InstalledOn]   NVARCHAR (300) NULL,
    [Lastchanged]   DATETIME       CONSTRAINT [DF_tblQuickFixEngineeringhist_Lastchanged] DEFAULT (getdate()) NOT NULL,
    [Action]        NUMERIC (18)   NOT NULL,
    CONSTRAINT [PK_tblQuickFixEngineeringhist] PRIMARY KEY CLUSTERED ([Trackercode] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tblQuickFixEngineeringhist_tblAssets] FOREIGN KEY ([AssetID]) REFERENCES [dbo].[tblAssets] ([AssetID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_tblQuickFixEngineeringHist_7_578309320__K2_K1_K6_3]
    ON [dbo].[tblQuickFixEngineeringHist]([AssetID] ASC, [Trackercode] ASC, [Lastchanged] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

