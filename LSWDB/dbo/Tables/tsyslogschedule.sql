CREATE TABLE [dbo].[tsyslogschedule] (
    [ScheduleID]    INT             IDENTITY (1, 1) NOT NULL,
    [Servername]    NVARCHAR (60)   NOT NULL,
    [Scantype]      NUMERIC (18)    CONSTRAINT [DF_tsyslogschedule_Scantype] DEFAULT ((1)) NOT NULL,
    [Scantarget]    NVARCHAR (1024) NOT NULL,
    [Netbiosdomain] NVARCHAR (150)  NOT NULL,
    [EveryXvalue]   NUMERIC (18)    CONSTRAINT [DF_tsyslogschedule_EveryXvalue] DEFAULT ((60)) NOT NULL,
    [EveryX]        VARCHAR (1)     CONSTRAINT [DF_tsyslogschedule_EveryX] DEFAULT ('M') NOT NULL,
    [Enabled]       BIT             CONSTRAINT [DF_tsyslogschedule_Enabled] DEFAULT ((0)) NOT NULL,
    [LastScanned]   DATETIME        NULL,
    [Description]   NVARCHAR (1000) NULL,
    [ScanNow]       BIT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_tsyslogschedule] PRIMARY KEY CLUSTERED ([ScheduleID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsyslogschedule_tsysASServers] FOREIGN KEY ([Servername]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsyslogschedule_tsysASServers]
    ON [dbo].[tsyslogschedule]([Servername] ASC) WITH (FILLFACTOR = 90);

