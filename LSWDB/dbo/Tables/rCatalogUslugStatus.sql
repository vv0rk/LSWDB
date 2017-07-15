CREATE TABLE [dbo].[rCatalogUslugStatus] (
    [Id]     INT           NOT NULL,
    [Status] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [AK_rCatalogUslugStatus_Status] UNIQUE NONCLUSTERED ([Status] ASC) WITH (FILLFACTOR = 90)
);

