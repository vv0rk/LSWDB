CREATE TABLE [dbo].[r1CSprav] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [nrNom]        NVARCHAR (50)  NULL,
    [name]         NVARCHAR (255) NOT NULL,
    [nameLong]     NVARCHAR (255) NOT NULL,
    [IdAnalog]     INT            NULL,
    [Id1CCategory] INT            NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_r1CSprav_r1CCategory_Id1CCategory_Id] FOREIGN KEY ([Id1CCategory]) REFERENCES [dbo].[r1CCategory] ([Id]),
    CONSTRAINT [FK_r1CSprav_rMaterialAnalog_Id] FOREIGN KEY ([IdAnalog]) REFERENCES [dbo].[rMaterialAnalog] ([Id]),
    CONSTRAINT [AK_r1CSprav_nrNom] UNIQUE NONCLUSTERED ([nrNom] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[r1CSprav] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[r1CSprav] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[r1CSprav] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[r1CSprav] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[r1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[r1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[r1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[r1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[r1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[r1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[r1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[r1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[r1CSprav] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[r1CSprav] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[r1CSprav] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[r1CSprav] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[r1CSprav] TO [IE\UIT_USERS_VR]
    AS [dbo];

