CREATE TABLE [dbo].[tsysIPExclude] (
    [Servername] NVARCHAR (60)  NOT NULL,
    [IPaddress]  VARCHAR (50)   NOT NULL,
    [Comment]    NVARCHAR (150) NULL,
    CONSTRAINT [PK_tsysIPExclude] PRIMARY KEY CLUSTERED ([Servername] ASC, [IPaddress] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysIPExclude_tsysASServers] FOREIGN KEY ([Servername]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);

