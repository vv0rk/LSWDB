CREATE TABLE [dbo].[htblcalendarsettings] (
    [SettingID]          INT            IDENTITY (1, 1) NOT NULL,
    [UserID]             INT            NOT NULL,
    [EventTypeFilter]    NVARCHAR (100) NULL,
    [AgentFilter]        NVARCHAR (100) NULL,
    [TeamFilter]         NVARCHAR (100) NULL,
    [MyEventFilter]      BIT            NULL,
    [DisabledEventTypes] NVARCHAR (100) NULL,
    CONSTRAINT [PK_htblcalendarsettings] PRIMARY KEY CLUSTERED ([SettingID] ASC) WITH (FILLFACTOR = 90)
);

