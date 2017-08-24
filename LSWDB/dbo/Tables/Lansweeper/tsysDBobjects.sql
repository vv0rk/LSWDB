CREATE TABLE [dbo].[tsysDBobjects] (
    [DBobjName]      NVARCHAR (75)  NOT NULL,
    [Query]          NTEXT          NULL,
    [Comment]        VARCHAR (300)  NULL,
    [DisplayName]    NVARCHAR (300) NULL,
    [HDOverseerOnly] BIT            DEFAULT ((0)) NULL,
    CONSTRAINT [PK_tsysDBobjects] PRIMARY KEY CLUSTERED ([DBobjName] ASC) WITH (FILLFACTOR = 90)
);

