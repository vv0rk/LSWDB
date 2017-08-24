CREATE TABLE [dbo].[htblschedulerepeat] (
    [repeatid]    INT          IDENTITY (1, 1) NOT NULL,
    [scheduleid]  INT          NOT NULL,
    [repeattype]  INT          DEFAULT ((1)) NOT NULL,
    [amount]      INT          DEFAULT ((1)) NOT NULL,
    [dayofmonth]  BIT          DEFAULT ((0)) NOT NULL,
    [day]         INT          DEFAULT ((1)) NULL,
    [ends]        INT          DEFAULT ((1)) NOT NULL,
    [occurrences] INT          DEFAULT ((15)) NULL,
    [weekdays]    NVARCHAR (7) DEFAULT ('0000000') NOT NULL,
    [enddate]     DATETIME     DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_htblschedulerepeat] PRIMARY KEY CLUSTERED ([repeatid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblschedulerepeat_htblschedule] FOREIGN KEY ([scheduleid]) REFERENCES [dbo].[htblschedule] ([scheduleid]) ON DELETE CASCADE,
    CONSTRAINT [AK_scheduleid] UNIQUE NONCLUSTERED ([scheduleid] ASC) WITH (FILLFACTOR = 90)
);

