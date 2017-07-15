CREATE TABLE [dbo].[rSpec] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [idrZayavka] INT            NOT NULL,
    [Spec]       NVARCHAR (500) NOT NULL,
    [LinkSpec]   NVARCHAR (500) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rZayavka_rSpec] FOREIGN KEY ([idrZayavka]) REFERENCES [dbo].[rZayavka] ([Id])
);

