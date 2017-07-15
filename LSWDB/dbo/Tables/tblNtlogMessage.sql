CREATE TABLE [dbo].[tblNtlogMessage] (
    [MessageID] INT             IDENTITY (1, 1) NOT NULL,
    [Hash]      VARCHAR (40)    NOT NULL,
    [Message]   NVARCHAR (3900) NOT NULL,
    CONSTRAINT [PK_tblntlogmessage] PRIMARY KEY CLUSTERED ([MessageID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblNtlogMessage]
    ON [dbo].[tblNtlogMessage]([Hash] ASC) WITH (FILLFACTOR = 90);

