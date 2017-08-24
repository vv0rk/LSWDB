CREATE TABLE [dbo].[htbltickettypecustomfield] (
    [tickettypeid]            INT     NOT NULL,
    [fieldid]                 INT     NOT NULL,
    [orderindex]              TINYINT NULL,
    [agentonly]               BIT     DEFAULT ((0)) NULL,
    [requiredonclosing]       BIT     DEFAULT ((0)) NOT NULL,
    [requiredoncreation]      BIT     DEFAULT ((0)) NOT NULL,
    [tickettypecustomfieldid] INT     IDENTITY (1, 1) NOT NULL,
    [collapsed]               BIT     DEFAULT ((0)) NOT NULL,
    [linked]                  BIT     DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_htbltickettypecustomfield] PRIMARY KEY CLUSTERED ([tickettypecustomfieldid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htbltickettypecustomfield_htblcustomfields] FOREIGN KEY ([fieldid]) REFERENCES [dbo].[htblcustomfields] ([fieldid]) ON DELETE CASCADE,
    CONSTRAINT [FK_htbltickettypecustomfield_htbltickettypes] FOREIGN KEY ([tickettypeid]) REFERENCES [dbo].[htbltickettypes] ([tickettypeid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htbltickettypecustomfield_htbltickettypes]
    ON [dbo].[htbltickettypecustomfield]([tickettypeid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htbltickettypecustomfield_htblcustomfields]
    ON [dbo].[htbltickettypecustomfield]([fieldid] ASC) WITH (FILLFACTOR = 90);

