CREATE TABLE [dbo].[htblcustomfieldvalues] (
    [fieldvalueid] INT            IDENTITY (1, 1) NOT NULL,
    [fieldid]      INT            NOT NULL,
    [value]        NVARCHAR (500) NULL,
    [color]        NVARCHAR (10)  DEFAULT ('#ffffff') NULL,
    [color2]       NVARCHAR (10)  DEFAULT ('#ffffff') NULL,
    [visible]      BIT            DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_htblcustomfieldvalues] PRIMARY KEY CLUSTERED ([fieldvalueid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblcustomfieldvalues_htblcustomfields] FOREIGN KEY ([fieldid]) REFERENCES [dbo].[htblcustomfields] ([fieldid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblcustomfieldvalues_htblcustomfields]
    ON [dbo].[htblcustomfieldvalues]([fieldid] ASC) WITH (FILLFACTOR = 90);

