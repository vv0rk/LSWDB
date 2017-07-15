CREATE TABLE [dbo].[rCompany$] (
    [ Название организации] NVARCHAR (255) NULL,
    [Филиал]                NVARCHAR (255) NULL,
    [Code]                  NVARCHAR (255) NULL,
    [Parent]                NVARCHAR (255) NULL,
    [Код ENG]               NVARCHAR (50)  NULL,
    [id]                    INT            IDENTITY (1, 1) NOT NULL,
    [numPC]                 INT            NULL,
    [Comment]               NVARCHAR (255) NULL,
    [titleNaumen]           NVARCHAR (255) NULL,
    [IdCompanyDogovor]      INT            NULL,
    [IdOU]                  INT            NULL,
    [INN]                   NVARCHAR (30)  NULL,
    [idOUmod]               INT            NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);

