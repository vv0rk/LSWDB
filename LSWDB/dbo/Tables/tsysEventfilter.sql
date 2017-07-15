CREATE TABLE [dbo].[tsysEventfilter] (
    [FilterID]     INT             IDENTITY (1, 1) NOT NULL,
    [AlertID]      INT             NOT NULL,
    [Compare]      INT             NOT NULL,
    [Operator]     INT             NOT NULL,
    [Comparevalue] NVARCHAR (1000) NOT NULL,
    CONSTRAINT [PK_tsysEventfilter] PRIMARY KEY CLUSTERED ([FilterID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tsysEventfilter_tsysEventAlerts] FOREIGN KEY ([AlertID]) REFERENCES [dbo].[tsysEventAlerts] ([AlertID]) ON DELETE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysEventfilter_tsysEventAlerts]
    ON [dbo].[tsysEventfilter]([AlertID] ASC) WITH (FILLFACTOR = 90);

