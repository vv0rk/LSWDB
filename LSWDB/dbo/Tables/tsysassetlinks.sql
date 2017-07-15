CREATE TABLE [dbo].[tsysassetlinks] (
    [Vendor]    VARCHAR (300)  NOT NULL,
    [Assetlink] VARCHAR (1024) NOT NULL,
    PRIMARY KEY CLUSTERED ([Vendor] ASC) WITH (FILLFACTOR = 90)
);

