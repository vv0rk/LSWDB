CREATE TABLE [dbo].[tsysASWorkgroups] (
    [Servername]  NVARCHAR (60)   NOT NULL,
    [Workgroup]   NVARCHAR (50)   NOT NULL,
    [Description] NVARCHAR (1000) NULL,
    [ScanNow]     BIT             DEFAULT ((0)) NOT NULL,
    [LastScanned] DATETIME        NULL,
    [Enabled]     BIT             DEFAULT ((1)) NOT NULL,
    [ErrorText]   NVARCHAR (250)  NULL,
    CONSTRAINT [PK_tsysASWorkgroups] PRIMARY KEY CLUSTERED ([Servername] ASC, [Workgroup] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysASWorkgroups_tsysASServers] FOREIGN KEY ([Servername]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE
);

