CREATE TABLE [dbo].[htblcustomfields] (
    [fieldid]        INT            IDENTITY (1, 1) NOT NULL,
    [name]           NVARCHAR (500) NULL,
    [type]           INT            NOT NULL,
    [labeltext]      NVARCHAR (500) NULL,
    [editable]       BIT            NOT NULL,
    [showinoverview] BIT            DEFAULT ((0)) NULL,
    [showinsummary]  BIT            DEFAULT ((0)) NULL,
    CONSTRAINT [Tmp_PK_htblcustomfields] PRIMARY KEY CLUSTERED ([fieldid] ASC) WITH (FILLFACTOR = 90)
);

