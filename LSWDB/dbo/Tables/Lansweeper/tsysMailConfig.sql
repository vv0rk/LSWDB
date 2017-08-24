CREATE TABLE [dbo].[tsysMailConfig] (
    [ConfigID]            INT             IDENTITY (1, 1) NOT NULL,
    [ServerName]          NVARCHAR (60)   NULL,
    [SMTPserver]          NVARCHAR (250)  NULL,
    [SMTPport]            INT             NULL,
    [SMTPFrom]            NVARCHAR (250)  NULL,
    [SMTPFromDisplay]     NVARCHAR (250)  NULL,
    [SMTPAuthenticate]    BIT             NULL,
    [SMTPUsername]        NVARCHAR (255)  NULL,
    [SMTPPassword]        NVARCHAR (4000) NULL,
    [SendAlertReports]    BIT             NULL,
    [SendEventAlerts]     BIT             NULL,
    [SMTPUseSSL]          BIT             NULL,
    [Mailnow]             BIT             NULL,
    [LastMailed]          DATETIME        NULL,
    [SMTPPasswordKeyHash] INT             NULL,
    [SMTPSSL]             TINYINT         NULL,
    [Error]               INT             NULL,
    [ErrorText]           NVARCHAR (4000) NULL,
    [LastTried]           DATETIME        NULL,
    CONSTRAINT [FK_tsysMailConfig_tsysASServers] FOREIGN KEY ([ServerName]) REFERENCES [dbo].[tsysASServers] ([Servername]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_tsysMailConfig_tsysASServers]
    ON [dbo].[tsysMailConfig]([ServerName] ASC) WITH (FILLFACTOR = 90);

