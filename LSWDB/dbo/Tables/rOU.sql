CREATE TABLE [dbo].[rOU] (
    [id]                 BIGINT          NOT NULL,
    [creation_date]      DATETIME2 (7)   NOT NULL,
    [last_modified_date] DATETIME2 (7)   NULL,
    [removal_date]       DATETIME2 (7)   NULL,
    [removed]            BIT             NOT NULL,
    [title]              NVARCHAR (4000) NULL,
    [case_id]            NVARCHAR (255)  NOT NULL,
    [num_]               BIGINT          NULL,
    [author_id]          BIGINT          NULL,
    [system_icon_id]     BIGINT          NULL,
    [head_id]            BIGINT          NULL,
    [parent_id]          BIGINT          NULL,
    [icon]               BIGINT          NULL,
    [idHolder]           NVARCHAR (255)  NULL,
    [objectGUID]         NVARCHAR (255)  NULL,
    [city]               NVARCHAR (255)  NULL,
    [cityEng]            NVARCHAR (255)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90)
);

