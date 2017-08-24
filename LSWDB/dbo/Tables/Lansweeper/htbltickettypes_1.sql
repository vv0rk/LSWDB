CREATE TABLE [dbo].[htbltickettypes] (
    [tickettypeid]       INT           NOT NULL,
    [typename]           NVARCHAR (50) NULL,
    [icon]               NVARCHAR (50) NULL,
    [agentid]            INT           NULL,
    [enabled]            BIT           DEFAULT ((1)) NULL,
    [notetype]           INT           DEFAULT ((1)) NULL,
    [replacementid]      INT           DEFAULT (NULL) NULL,
    [ignoredefaultstate] BIT           DEFAULT ((0)) NOT NULL,
    [initialdescription] INT           NULL,
    [extraticketoptions] INT           NULL,
    [timeworked]         BIT           NULL,
    [initialpriority]    BIT           DEFAULT ((0)) NOT NULL,
    [addccusers]         BIT           CONSTRAINT [DF_htbltickettypes_addccusers] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_htbltickettypes] PRIMARY KEY CLUSTERED ([tickettypeid] ASC) WITH (FILLFACTOR = 90),
    FOREIGN KEY ([replacementid]) REFERENCES [dbo].[htbltickettypes] ([tickettypeid]),
    CONSTRAINT [FK_htbltickettypes_htblagents] FOREIGN KEY ([agentid]) REFERENCES [dbo].[htblagents] ([agentid])
);


GO
CREATE NONCLUSTERED INDEX [IX_htbltickettypes_htblagents]
    ON [dbo].[htbltickettypes]([agentid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htbltickettypes_htbltickettypes]
    ON [dbo].[htbltickettypes]([replacementid] ASC) WITH (FILLFACTOR = 90);

