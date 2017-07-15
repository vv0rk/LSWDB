CREATE TABLE [dbo].[rOUMod] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [removed]     BIT             DEFAULT ((0)) NOT NULL,
    [title]       NVARCHAR (4000) NULL,
    [case_id]     NVARCHAR (255)  NULL,
    [parent_id]   INT             NULL,
    [IdrOU]       BIGINT          NOT NULL,
    [idparent_id] BIGINT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

