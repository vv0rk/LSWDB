CREATE TABLE [dbo].[rDvicesList] (
    [DeviceName] NVARCHAR (100) NOT NULL,
    [Comment]    NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([DeviceName] ASC) WITH (FILLFACTOR = 90)
);

