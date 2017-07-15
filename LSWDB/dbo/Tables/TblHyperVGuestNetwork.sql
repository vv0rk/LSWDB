CREATE TABLE [dbo].[TblHyperVGuestNetwork] (
    [HyperVGuestNetworkID] INT           IDENTITY (1, 1) NOT NULL,
    [HyperVGuestID]        INT           NOT NULL,
    [MacAddress]           NVARCHAR (50) NULL,
    [LastChanged]          DATETIME      CONSTRAINT [DF_TblHyperVGuestNetwork_LastChanged] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_TblHyperVGuestNetwork] PRIMARY KEY CLUSTERED ([HyperVGuestNetworkID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblHyperVGuestNetwork_tblHyperVGuest] FOREIGN KEY ([HyperVGuestID]) REFERENCES [dbo].[tblHyperVGuest] ([hypervguestID]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblHyperVGuestNetwork_tblHyperVGuest]
    ON [dbo].[TblHyperVGuestNetwork]([HyperVGuestID] ASC) WITH (FILLFACTOR = 90);

