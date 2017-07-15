CREATE TABLE [dbo].[rCompanyCustLink] (
    [Id]            INT IDENTITY (1, 1) NOT NULL,
    [IdCust]        INT NULL,
    [IdIPLocations] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rCompanyCustLink_rCompanyCust_IdCust] FOREIGN KEY ([IdCust]) REFERENCES [dbo].[rCompanyCust] ([Id]),
    CONSTRAINT [FK_rCompanyCustLink_tsysIPLocations_IdIPLocations] FOREIGN KEY ([IdIPLocations]) REFERENCES [dbo].[tsysIPLocations] ([LocationID])
);

