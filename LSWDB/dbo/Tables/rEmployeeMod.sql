CREATE TABLE [dbo].[rEmployeeMod] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [removed]        BIT             DEFAULT ((0)) NOT NULL,
    [title]          NVARCHAR (4000) NULL,
    [post]           NVARCHAR (255)  NULL,
    [parent_id]      INT             NULL,
    [IdrEmployee]    BIGINT          NOT NULL,
    [idparent_id]    BIGINT          NULL,
    [organisation]   INT             NULL,
    [idorganisation] BIGINT          NULL,
    [Custom1]        NVARCHAR (255)  NULL,
    [Custom2]        NVARCHAR (255)  NULL,
    [Custom3]        NVARCHAR (255)  NULL,
    [Custom4]        NVARCHAR (255)  NULL,
    [Custom19]       NVARCHAR (255)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

