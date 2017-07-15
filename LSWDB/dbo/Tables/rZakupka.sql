CREATE TABLE [dbo].[rZakupka] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [idrSpec]   INT            NOT NULL,
    [DateStart] DATETIME       DEFAULT (getdate()) NOT NULL,
    [Spec]      NVARCHAR (500) NOT NULL,
    [LinkSpec]  NVARCHAR (500) NOT NULL,
    [LinkDoc]   NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rZakupka_rSpec] FOREIGN KEY ([idrSpec]) REFERENCES [dbo].[rSpec] ([Id])
);

