CREATE TABLE [dbo].[tsysWebTabs] (
    [TabID]      INT            IDENTITY (1, 1) NOT NULL,
    [TabName]    NVARCHAR (255) NOT NULL,
    [PageID]     INT            NOT NULL,
    [TemplateID] INT            NOT NULL,
    [Sortorder]  INT            NULL,
    [GlobalTabs] BIT            DEFAULT ((0)) NOT NULL,
    [Helpdesk]   BIT            NULL,
    CONSTRAINT [PK_tsysWebTabs] PRIMARY KEY CLUSTERED ([TabID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_tsysWebTabs_tsysWebUsers] FOREIGN KEY ([PageID]) REFERENCES [dbo].[tsysWebUsers] ([PageID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tsysWebTabs_tsysWebUsers]
    ON [dbo].[tsysWebTabs]([PageID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE);

