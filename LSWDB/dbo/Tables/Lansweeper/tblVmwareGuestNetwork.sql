CREATE TABLE [dbo].[tblVmwareGuestNetwork] (
    [GuestNetworkID] BIGINT       IDENTITY (1, 1) NOT NULL,
    [GuestID]        BIGINT       NOT NULL,
    [MacAddress]     VARCHAR (50) NULL,
    [lastchanged]    DATETIME     CONSTRAINT [DF_tblVmwareGuestNetwork_lastchanged] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_tblVmwareGuestNetwork] PRIMARY KEY CLUSTERED ([GuestNetworkID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_tblVmwareGuestNetwork_tblVmwareGuest] FOREIGN KEY ([GuestID]) REFERENCES [dbo].[tblVmwareGuest] ([GuestID]) ON DELETE CASCADE ON UPDATE CASCADE NOT FOR REPLICATION
);


GO
CREATE NONCLUSTERED INDEX [IxFK_tblVmwareGuestNetwork_tblVmwareGuest]
    ON [dbo].[tblVmwareGuestNetwork]([GuestID] ASC) WITH (FILLFACTOR = 90);

