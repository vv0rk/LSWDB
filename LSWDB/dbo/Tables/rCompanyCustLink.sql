CREATE TABLE [dbo].[rCompanyCustLink] (
    [Id]            INT IDENTITY (1, 1) NOT NULL,
    [IdCust]        INT NULL,
    [IdIPLocations] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rCompanyCustLink_rCompanyCust_IdCust] FOREIGN KEY ([IdCust]) REFERENCES [dbo].[rCompanyCust] ([Id]),
    CONSTRAINT [FK_rCompanyCustLink_tsysIPLocations_IdIPLocations] FOREIGN KEY ([IdIPLocations]) REFERENCES [dbo].[tsysIPLocations] ([LocationID])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rCompanyCustLink] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rCompanyCustLink] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rCompanyCustLink] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rCompanyCustLink] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rCompanyCustLink] TO [IE\UIT_USERS_VR]
    AS [dbo];

