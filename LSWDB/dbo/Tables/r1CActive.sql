CREATE TABLE [dbo].[r1CActive] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Company]      NVARCHAR (100) NOT NULL,
    [nrInv]        NVARCHAR (20)  NOT NULL,
    [nrSerial]     NVARCHAR (50)  NULL,
    [Nomenclatura] NVARCHAR (200) NOT NULL,
    [nrNom]        NVARCHAR (20)  NOT NULL,
    [Responce]     NVARCHAR (100) NOT NULL,
    [Departament]  NVARCHAR (100) NOT NULL,
    [Office]       NVARCHAR (20)  NOT NULL,
    [Address]      NVARCHAR (200) NOT NULL,
    [Status]       INT            DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_r1CActive_r1CActiveStatus_Status] FOREIGN KEY ([Status]) REFERENCES [dbo].[r1CActiveStatus] ([Id]),
    UNIQUE NONCLUSTERED ([nrInv] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[r1CActive] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[r1CActive] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[r1CActive] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[r1CActive] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[r1CActive] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[r1CActive] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[r1CActive] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[r1CActive] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[r1CActive] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[r1CActive] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[r1CActive] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[r1CActive] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[r1CActive] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[r1CActive] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[r1CActive] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[r1CActive] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[r1CActive] TO [IE\UIT_USERS_VR]
    AS [dbo];

