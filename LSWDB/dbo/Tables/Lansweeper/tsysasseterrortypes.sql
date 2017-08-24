CREATE TABLE [dbo].[tsysasseterrortypes] (
    [Errortype] INT            NOT NULL,
    [ErrorMsg]  NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_tsyserrortypes] PRIMARY KEY CLUSTERED ([Errortype] ASC) WITH (FILLFACTOR = 90)
);

