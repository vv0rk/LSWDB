CREATE TABLE [dbo].[htblcustomfieldvaluelinks] (
    [linkid]        INT IDENTITY (1, 1) NOT NULL,
    [fieldvalueid]  INT NOT NULL,
    [fieldid]       INT NOT NULL,
    [sortorder]     INT DEFAULT ((1)) NULL,
    [parentfieldid] INT NULL,
    CONSTRAINT [PK_htblcustomfieldvaluelinks] PRIMARY KEY CLUSTERED ([linkid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblcustomfieldvaluelinks_htblcustomfieldvalues] FOREIGN KEY ([fieldvalueid]) REFERENCES [dbo].[htblcustomfieldvalues] ([fieldvalueid]),
    CONSTRAINT [FK_htblcustomfieldvaluelinks_htbltickettypecustomfield] FOREIGN KEY ([fieldid]) REFERENCES [dbo].[htbltickettypecustomfield] ([tickettypecustomfieldid]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblcustomfieldvaluelinks_htblcustomfieldvalues]
    ON [dbo].[htblcustomfieldvaluelinks]([fieldvalueid] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_htblcustomfieldvaluelinks_htbltickettypecustomfield]
    ON [dbo].[htblcustomfieldvaluelinks]([fieldid] ASC) WITH (FILLFACTOR = 90);

