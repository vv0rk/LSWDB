CREATE TABLE [dbo].[tblLoginLog] (
    [LogID]     INT            IDENTITY (1, 1) NOT NULL,
    [Success]   BIT            NOT NULL,
    [IPAddress] NVARCHAR (500) NOT NULL,
    [UserName]  NVARCHAR (100) NOT NULL,
    [Date]      DATETIME       CONSTRAINT [DF_tblLoginLog_Date] DEFAULT (getdate()) NOT NULL,
    [cert]      NVARCHAR (300) NULL,
    CONSTRAINT [PK_tblLoginLog] PRIMARY KEY CLUSTERED ([LogID] ASC) WITH (FILLFACTOR = 90)
);

