CREATE TABLE [dbo].[rCompanyDogovor] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (100) NULL,
    [Number]     NVARCHAR (50)  NULL,
    [DateStart]  DATETIME       NULL,
    [DateUpdate] DATETIME       NULL,
    [Status]     NCHAR (20)     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

