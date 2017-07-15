CREATE TABLE [dbo].[r1CActive] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Company]      NVARCHAR (100) NOT NULL,
    [nrInv]        NVARCHAR (20)  NOT NULL,
    [nrSerial]     NVARCHAR (50)  NULL,
    [Nomenclatura] NVARCHAR (200) NOT NULL,
    [nrNom]        NVARCHAR (20)  NOT NULL,
    [Responce]     NVARCHAR (100) NOT NULL,
    [Departament]  NVARCHAR (100) NOT NULL,
    [Office]       NVARCHAR (20)  NOT NULL,
    [Address]      NVARCHAR (200) NOT NULL,
    [Status]       INT            DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_r1CActive_r1CActiveStatus_Status] FOREIGN KEY ([Status]) REFERENCES [dbo].[r1CActiveStatus] ([Id]),
    UNIQUE NONCLUSTERED ([nrInv] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);

