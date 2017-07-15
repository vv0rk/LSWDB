CREATE TABLE [dbo].[rZayavka] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [DeviceList] NVARCHAR (100) NOT NULL,
    [idrShtatR]  INT            NOT NULL,
    [Comment]    NVARCHAR (255) NULL,
    [Gorod]      NVARCHAR (100) NULL,
    [Address]    NVARCHAR (255) NULL,
    [Office]     NVARCHAR (100) NULL,
    [LinkSource] NVARCHAR (500) NOT NULL,
    [Status]     NVARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

