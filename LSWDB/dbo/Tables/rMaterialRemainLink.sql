CREATE TABLE [dbo].[rMaterialRemainLink] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [idModel]            INT            NOT NULL,
    [TonerName]          NVARCHAR (150) NOT NULL,
    [TonerColorName]     NVARCHAR (100) NULL,
    [idMaterialOriginal] INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rMaterialRemainLink_rMaterialOriginal_idMaterialOriginal_Id] FOREIGN KEY ([idMaterialOriginal]) REFERENCES [dbo].[rMaterialOriginal] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_rMaterialRemainLink_rModelDevice_idModel_Id] FOREIGN KEY ([idModel]) REFERENCES [dbo].[rModelDevice] ([Id]) ON DELETE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_rMaterialRemainLink_idModel_TonerName_TonerColorName]
    ON [dbo].[rMaterialRemainLink]([idModel] ASC, [TonerName] ASC, [TonerColorName] ASC) WITH (FILLFACTOR = 90);

