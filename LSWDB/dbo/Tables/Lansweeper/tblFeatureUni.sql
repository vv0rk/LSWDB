CREATE TABLE [dbo].[tblFeatureUni] (
    [featUniID]      INT            IDENTITY (1, 1) NOT NULL,
    [featureName]    NVARCHAR (300) NULL,
    [featureCaption] NVARCHAR (150) NULL,
    [addedDate]      DATETIME       CONSTRAINT [DF_tblFeatureUni_Added] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblFeatureUni] PRIMARY KEY CLUSTERED ([featUniID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblFeatureUni]
    ON [dbo].[tblFeatureUni]([featureName] ASC, [featureCaption] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

