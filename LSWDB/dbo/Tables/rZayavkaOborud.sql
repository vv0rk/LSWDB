CREATE TABLE [dbo].[rZayavkaOborud] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Type]        NVARCHAR (100) NOT NULL,
    [idrPersonal] INT            NULL,
    [idrShtatR]   INT            NOT NULL,
    [Comments]    NVARCHAR (255) NULL,
    [Document]    NVARCHAR (400) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rShtatR_ID] FOREIGN KEY ([idrShtatR]) REFERENCES [dbo].[rShtatR] ([Id])
);

