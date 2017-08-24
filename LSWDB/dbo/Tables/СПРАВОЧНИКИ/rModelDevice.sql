CREATE TABLE [dbo].[rModelDevice] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Model]          NVARCHAR (255) NOT NULL,
    [IdManufacturer] INT            NULL,
    [Resource]       INT            NULL,
    [Recomend]       INT            NULL,
    [idFormat] INT null, 
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rManufacturer_rModelDevice_IdManufacturer] FOREIGN KEY ([IdManufacturer]) REFERENCES [dbo].[rManufacturer] ([Id]),
    CONSTRAINT [AK_Model] UNIQUE NONCLUSTERED ([Model] ASC) WITH (FILLFACTOR = 90),
	CONSTRAINT [FK_rModelDevice_rFormat] FOREIGN KEY (idFormat) REFERENCES rFormatPrinter([Id])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rModelDevice] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rModelDevice] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rModelDevice] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rModelDevice] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rModelDevice] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rModelDevice] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rModelDevice] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rModelDevice] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rModelDevice] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rModelDevice] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT TAKE OWNERSHIP
    ON OBJECT::[dbo].[rModelDevice] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rModelDevice] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rModelDevice] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rModelDevice] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rModelDevice] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rModelDevice] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rModelDevice] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rModelDevice] TO [IE\UIT_USERS_VR]
    AS [dbo];

