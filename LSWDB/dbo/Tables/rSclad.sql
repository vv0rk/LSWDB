CREATE TABLE [dbo].[rSclad] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Company]   NVARCHAR (100) NOT NULL,
    [Gorod]     NVARCHAR (50)  NOT NULL,
    [Address]   NVARCHAR (255) NOT NULL,
    [Respons]   NVARCHAR (100) NOT NULL,
    [ScladName] NVARCHAR (100) DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

