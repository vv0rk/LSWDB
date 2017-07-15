CREATE TABLE [dbo].[tsyseventignore] (
    [IgnoreID]   INT            IDENTITY (1, 1) NOT NULL,
    [Sourcename] NVARCHAR (100) NOT NULL,
    [Eventcode]  INT            NULL,
    [Comment]    NVARCHAR (150) NULL,
    CONSTRAINT [PK_tsyseventignore] PRIMARY KEY CLUSTERED ([IgnoreID] ASC) WITH (FILLFACTOR = 90)
);

