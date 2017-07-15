CREATE TABLE [dbo].[tsyserrors] (
    [Errorid]    INT             IDENTITY (1, 1) NOT NULL,
    [Errortype]  INT             NOT NULL,
    [Errormsg]   NVARCHAR (4000) NULL,
    [Scanserver] NVARCHAR (300)  NULL,
    [Added]      DATETIME        CONSTRAINT [DF_tsyserrors_Added] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_tsyserrors] PRIMARY KEY CLUSTERED ([Errorid] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tsyserrors_tsyserrortype] FOREIGN KEY ([Errortype]) REFERENCES [dbo].[tsyserrortype] ([ErrorType]) NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsyserrors_tsyserrortype]
    ON [dbo].[tsyserrors]([Errortype] ASC) WITH (FILLFACTOR = 90);

