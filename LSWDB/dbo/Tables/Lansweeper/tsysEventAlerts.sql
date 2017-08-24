CREATE TABLE [dbo].[tsysEventAlerts] (
    [AlertID]   INT            IDENTITY (1, 1) NOT NULL,
    [Alertname] NVARCHAR (500) NOT NULL,
    [Enabled]   BIT            CONSTRAINT [DF_tsysEventAlerts_Enabled] DEFAULT ((0)) NOT NULL,
    [Mailgroup] NVARCHAR (250) NULL,
    CONSTRAINT [PK_tsysEventAlerts] PRIMARY KEY CLUSTERED ([AlertID] ASC) WITH (FILLFACTOR = 90)
);

