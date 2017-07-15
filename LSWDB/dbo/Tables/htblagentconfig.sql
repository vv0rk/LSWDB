CREATE TABLE [dbo].[htblagentconfig] (
    [agentconfigid]       INT IDENTITY (1, 1) NOT NULL,
    [agentid]             INT NOT NULL,
    [shortcuts]           BIT DEFAULT ((0)) NULL,
    [emailoncreation]     BIT DEFAULT ((0)) NULL,
    [emailonassigned]     BIT DEFAULT ((0)) NULL,
    [emailonagentupdate]  BIT DEFAULT ((0)) NULL,
    [emailonclientupdate] BIT DEFAULT ((0)) NULL,
    [emailonstatechange]  BIT DEFAULT ((0)) NULL,
    [emailonmyupdate]     BIT DEFAULT ((0)) NULL,
    [emailonteamchange]   BIT DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_htblagentconfig] PRIMARY KEY CLUSTERED ([agentconfigid] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblagentconfig_htblagents] FOREIGN KEY ([agentid]) REFERENCES [dbo].[htblagents] ([agentid]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_htblagentconfig_htblagents]
    ON [dbo].[htblagentconfig]([agentid] ASC) WITH (FILLFACTOR = 90);

