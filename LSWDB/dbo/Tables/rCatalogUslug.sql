CREATE TABLE [dbo].[rCatalogUslug] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (255) NOT NULL,
    [StatusId] INT            DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rCatalogUslug_rCatalogUslugStatus_StatusId_Id] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[rCatalogUslugStatus] ([Id]),
    CONSTRAINT [AK_rCatalogUslug_Name] UNIQUE NONCLUSTERED ([Name] ASC) WITH (FILLFACTOR = 90)
);

