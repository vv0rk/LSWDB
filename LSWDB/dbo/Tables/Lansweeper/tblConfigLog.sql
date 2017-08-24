CREATE TABLE [dbo].[tblConfigLog] (
    [LogID]       INT            IDENTITY (1, 1) NOT NULL,
    [ActionID]    INT            NOT NULL,
    [Description] NVARCHAR (500) NOT NULL,
    [OldValue]    NVARCHAR (500) NULL,
    [NewValue]    NVARCHAR (500) NULL,
    [UserID]      INT            NOT NULL,
    [Date]        DATETIME       CONSTRAINT [DF_tblConfigLog_Date] DEFAULT (getdate()) NOT NULL,
    [displayname] NVARCHAR (100) NULL,
    CONSTRAINT [PK_tblConfigLog] PRIMARY KEY CLUSTERED ([LogID] ASC) WITH (FILLFACTOR = 90)
);

