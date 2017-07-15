CREATE TABLE [dbo].[rModelDevice] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Model]          NVARCHAR (255) NOT NULL,
    [IdManufacturer] INT            NULL,
    [Resource]       INT            NULL,
    [Recomend]       INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rManufacturer_rModelDevice_IdManufacturer] FOREIGN KEY ([IdManufacturer]) REFERENCES [dbo].[rManufacturer] ([Id]),
    CONSTRAINT [AK_Model] UNIQUE NONCLUSTERED ([Model] ASC) WITH (FILLFACTOR = 90)
);

