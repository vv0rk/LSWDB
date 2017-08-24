CREATE TABLE [dbo].[htblspecialrulestasks] (
    [taskid]          INT             IDENTITY (1, 1) NOT NULL,
    [ruleid]          INT             NOT NULL,
    [typeid]          INT             NOT NULL,
    [minutesdelay]    INT             NOT NULL,
    [minutesrequired] INT             NOT NULL,
    [title]           NVARCHAR (50)   NOT NULL,
    [description]     NVARCHAR (4000) NOT NULL,
    [allday]          BIT             DEFAULT ((0)) NULL,
    [showtoteam]      BIT             DEFAULT ((0)) NULL,
    CONSTRAINT [PK_htblspecialrulestasks] PRIMARY KEY CLUSTERED ([taskid] ASC) WITH (FILLFACTOR = 90)
);

