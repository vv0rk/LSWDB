CREATE TABLE [dbo].[rCustomsLog] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
    [AssetID]          INT            NOT NULL,
    [moddate]          DATETIME       NULL,
    [Custom1_old]      NVARCHAR (255) NULL,
    [Custom2_old]      NVARCHAR (255) NULL,
    [Custom3_old]      NVARCHAR (255) NULL,
    [Custom4_old]      NVARCHAR (255) NULL,
    [Custom5_old]      NVARCHAR (255) NULL,
    [Custom6_old]      NVARCHAR (255) NULL,
    [Custom7_old]      NVARCHAR (255) NULL,
    [Custom8_old]      NVARCHAR (255) NULL,
    [Custom9_old]      NVARCHAR (255) NULL,
    [Custom10_old]     NVARCHAR (255) NULL,
    [Custom11_old]     NVARCHAR (255) NULL,
    [Custom12_old]     NVARCHAR (255) NULL,
    [Custom13_old]     NVARCHAR (255) NULL,
    [Custom14_old]     NVARCHAR (255) NULL,
    [Custom15_old]     NVARCHAR (255) NULL,
    [Custom16_old]     NVARCHAR (255) NULL,
    [Custom17_old]     NVARCHAR (255) NULL,
    [Custom18_old]     NVARCHAR (255) NULL,
    [Custom19_old]     NVARCHAR (255) NULL,
    [Custom20_old]     NVARCHAR (255) NULL,
    [Custom1_new]      NVARCHAR (255) NULL,
    [Custom2_new]      NVARCHAR (255) NULL,
    [Custom3_new]      NVARCHAR (255) NULL,
    [Custom4_new]      NVARCHAR (255) NULL,
    [Custom5_new]      NVARCHAR (255) NULL,
    [Custom6_new]      NVARCHAR (255) NULL,
    [Custom7_new]      NVARCHAR (255) NULL,
    [Custom8_new]      NVARCHAR (255) NULL,
    [Custom9_new]      NVARCHAR (255) NULL,
    [Custom10_new]     NVARCHAR (255) NULL,
    [Custom11_new]     NVARCHAR (255) NULL,
    [Custom12_new]     NVARCHAR (255) NULL,
    [Custom13_new]     NVARCHAR (255) NULL,
    [Custom14_new]     NVARCHAR (255) NULL,
    [Custom15_new]     NVARCHAR (255) NULL,
    [Custom16_new]     NVARCHAR (255) NULL,
    [Custom17_new]     NVARCHAR (255) NULL,
    [Custom18_new]     NVARCHAR (255) NULL,
    [Custom19_new]     NVARCHAR (255) NULL,
    [Custom20_new]     NVARCHAR (255) NULL,
    [LogID]            BIGINT         NULL,
    [SerialNumber_old] NCHAR (255)    NULL,
    [SerialNumber_new] NCHAR (255)    NULL,
    [AssetName_old]    NVARCHAR (100) NULL,
    [AssetName_new]    NVARCHAR (100) NULL,
    [Parent_old]       INT            NULL,
    [Parent_new]       INT            NULL,
    [Child_old]        INT            NULL,
    [Child_new]        INT            NULL,
    [Table_src]        VARCHAR (50)   NULL,
    [Status_old]       NVARCHAR (50)  NULL,
    [Status_new]       NVARCHAR (50)  NULL,
    [Description_old]  NVARCHAR (255) NULL,
    [Description_new]  NVARCHAR (255) NULL,
    [Comment_old]      NVARCHAR (255) NULL,
    [Comment_new]      NVARCHAR (255) NULL,
    [User_src]         NVARCHAR (255) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rCustomsLog] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rCustomsLog] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rCustomsLog] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rCustomsLog] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rCustomsLog] TO [IE\UIT_USERS_VR]
    AS [dbo];

