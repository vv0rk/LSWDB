CREATE TABLE [dbo].[r1CActiveStatus] (
    [Id]     INT          IDENTITY (1, 1) NOT NULL,
    [Status] NVARCHAR (3) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90)
);

