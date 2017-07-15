CREATE TABLE [dbo].[rAssetsKsu] (
    [id]               INT              IDENTITY (1, 1) NOT NULL,
    [name]             NVARCHAR (255)   NOT NULL,
    [code]             NVARCHAR (32)    NOT NULL,
    [nomenclatureId]   INT              NULL,
    [inventoryNumber]  NVARCHAR (32)    NULL,
    [serialNumber]     NVARCHAR (32)    NULL,
    [mol]              NVARCHAR (255)   NULL,
    [organization]     NVARCHAR (255)   NOT NULL,
    [companyId]        INT              NOT NULL,
    [account]          NVARCHAR (12)    NULL,
    [count]            INT              NOT NULL,
    [configurationId]  INT              NULL,
    [categoryId]       INT              NULL,
    [room]             NVARCHAR (255)   NULL,
    [user]             NVARCHAR (255)   NULL,
    [withCategory]     BIT              NOT NULL,
    [registrationDate] DATETIME         NULL,
    [guid]             UNIQUEIDENTIFIER NULL,
    [Comment]          NVARCHAR (255)   NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rAssetsKsu_rCategory] FOREIGN KEY ([categoryId]) REFERENCES [dbo].[rCategory] ([id]),
    CONSTRAINT [FK_rAssetsKsu_rCompany] FOREIGN KEY ([companyId]) REFERENCES [dbo].[rCompany$] ([id]),
    CONSTRAINT [FK_rAssetsKsu_rConfiguration] FOREIGN KEY ([configurationId]) REFERENCES [dbo].[rConfiguration] ([id]),
    CONSTRAINT [FK_rAssetsKsu_rNomenclature] FOREIGN KEY ([nomenclatureId]) REFERENCES [dbo].[rNomenclature] ([id])
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rAssetsKsu] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAssetsKsu] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAssetsKsu] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rAssetsKsu] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rAssetsKsu] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAssetsKsu] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAssetsKsu] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rAssetsKsu] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rAssetsKsu] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rAssetsKsu] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rAssetsKsu] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rAssetsKsu] TO [IE\UIT_USERS_VR]
    AS [dbo];

