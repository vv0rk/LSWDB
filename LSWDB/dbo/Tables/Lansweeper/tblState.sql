CREATE TABLE [dbo].[tblState] (
    [State]       INT            NOT NULL,
    [Statename]   NVARCHAR (300) NOT NULL,
    [LastChanged] DATETIME       DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tblstate] PRIMARY KEY CLUSTERED ([State] ASC) WITH (FILLFACTOR = 90)
);

