CREATE TABLE [dbo].[rNomenclature] (
    [id]              INT              IDENTITY (1, 1) NOT NULL,
    [code]            NVARCHAR (12)    NOT NULL,
    [name]            NVARCHAR (255)   NOT NULL,
    [parentCode]      NVARCHAR (12)    NULL,
    [parentId]        INT              NULL,
    [configurationId] INT              NULL,
    [categoryId]      INT              NULL,
    [withCategory]    BIT              NOT NULL,
    [count]           INT              NOT NULL,
    [isGroup]         BIT              NOT NULL,
    [guid]            UNIQUEIDENTIFIER NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rNomenclature_parent] FOREIGN KEY ([parentId]) REFERENCES [dbo].[rNomenclature] ([id]),
    CONSTRAINT [FK_rNomenclature_rCategory] FOREIGN KEY ([categoryId]) REFERENCES [dbo].[rCategory] ([id]),
    CONSTRAINT [FK_rNomenclature_rConfiguration] FOREIGN KEY ([configurationId]) REFERENCES [dbo].[rConfiguration] ([id])
);

