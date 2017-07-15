CREATE TABLE [dbo].[rPrihod] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [IdSclad]  INT           NOT NULL,
    [Number]   NVARCHAR (20) NOT NULL,
    [Date]     DATETIME      NOT NULL,
    [IdStatus] INT           DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rPrihod_rPrihodStatus_IdStatus_Id] FOREIGN KEY ([IdStatus]) REFERENCES [dbo].[rPrihodStatus] ([Id]),
    CONSTRAINT [FK_rPrihod_rSclad_Id] FOREIGN KEY ([IdSclad]) REFERENCES [dbo].[rSclad] ([Id])
);

