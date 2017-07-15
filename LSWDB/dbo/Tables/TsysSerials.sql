CREATE TABLE [dbo].[TsysSerials] (
    [Product]    NVARCHAR (255) NOT NULL,
    [Regkey]     NVARCHAR (400) NOT NULL,
    [Enabled]    BIT            CONSTRAINT [DF_TsysSerials_Enabled] DEFAULT ((1)) NOT NULL,
    [SerialID]   NUMERIC (18)   CONSTRAINT [DF_TsysSerials_SerialID] DEFAULT ((1)) NOT NULL,
    [Value]      VARCHAR (300)  CONSTRAINT [DF_TsysSerials_Value] DEFAULT ('DigitalProductID') NOT NULL,
    [Variations] BIT            CONSTRAINT [DF_TsysSerials_Variations] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_tsysSerials] PRIMARY KEY CLUSTERED ([Product] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);

