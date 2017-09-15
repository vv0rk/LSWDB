CREATE TABLE [dbo].[rMaterialAnalog] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [IdManufacturer] INT            NULL,
    [PartNumber]     NVARCHAR (100) NOT NULL,
    [Name]           NVARCHAR (255) NOT NULL,
    [Resource]       INT            NULL,
    [AltName]        NVARCHAR (290) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_rManufacturer_rMaterialAnalog_Id] FOREIGN KEY ([IdManufacturer]) REFERENCES [dbo].[rManufacturer] ([Id]),
    CONSTRAINT [AK_rMaterialAnalog_PartNumber] UNIQUE NONCLUSTERED ([PartNumber] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rMaterialAnalog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rMaterialAnalog] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rMaterialAnalog] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rMaterialAnalog] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rMaterialAnalog] TO [IE\UIT_USERS_VR]
    AS [dbo];

