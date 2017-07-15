CREATE TABLE [dbo].[rPrihodSpec] (
    [Id]        INT IDENTITY (1, 1) NOT NULL,
    [IdPrihod]  INT NOT NULL,
    [Id1CSprav] INT NOT NULL,
    [Nr]        INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rPrihodSpec_r1CSprav_Id] FOREIGN KEY ([Id1CSprav]) REFERENCES [dbo].[r1CSprav] ([Id]),
    CONSTRAINT [FK_rPrihodSpec_rPrihod_Id] FOREIGN KEY ([IdPrihod]) REFERENCES [dbo].[rPrihod] ([Id])
);

