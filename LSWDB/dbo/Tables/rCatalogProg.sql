CREATE TABLE [dbo].[rCatalogProg] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [softwareName]   NVARCHAR (255) NOT NULL,
    [IdCatalogUslug] INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rCatalogProg_rCatalogUslug_IdCatalogUslug_Id] FOREIGN KEY ([IdCatalogUslug]) REFERENCES [dbo].[rCatalogUslug] ([Id]),
    CONSTRAINT [AK_rCatalogProg_softwareName] UNIQUE NONCLUSTERED ([softwareName] ASC) WITH (FILLFACTOR = 90)
);

