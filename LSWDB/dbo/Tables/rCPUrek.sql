CREATE TABLE [dbo].[rCPUrek] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [CPU]        NVARCHAR (255) NOT NULL,
    [idCategory] INT            DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_rCPUrek_rCPUcat_idCategory_id] FOREIGN KEY ([idCategory]) REFERENCES [dbo].[rCPUcat] ([Id])
);

