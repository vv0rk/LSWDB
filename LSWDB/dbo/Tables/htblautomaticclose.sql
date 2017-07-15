CREATE TABLE [dbo].[htblautomaticclose] (
    [autocloseid] INT      IDENTITY (1, 1) NOT NULL,
    [time1]       INT      NOT NULL,
    [time2]       INT      NOT NULL,
    [time3]       INT      NOT NULL,
    [day1]        BIT      NOT NULL,
    [day2]        BIT      NOT NULL,
    [day3]        BIT      NOT NULL,
    [mail1]       BIT      NOT NULL,
    [mail2]       BIT      NOT NULL,
    [message1]    NTEXT    NOT NULL,
    [message2]    NTEXT    NOT NULL,
    [lastedited]  DATETIME NULL,
    CONSTRAINT [pk_htblautomaticclose] PRIMARY KEY CLUSTERED ([autocloseid] ASC) WITH (FILLFACTOR = 90)
);

