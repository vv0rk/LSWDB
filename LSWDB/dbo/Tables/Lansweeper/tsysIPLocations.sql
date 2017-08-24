CREATE TABLE [dbo].[tsysIPLocations] (
    [StartIP]       NUMERIC (18)    NOT NULL,
    [EndIP]         NUMERIC (18)    NOT NULL,
    [IPLocation]    NVARCHAR (200)  NOT NULL,
    [Realstart]     VARCHAR (20)    NOT NULL,
    [Realend]       VARCHAR (20)    NOT NULL,
    [PackageShare]  NVARCHAR (2000) NULL,
    [ShareUsername] NVARCHAR (100)  NULL,
    [SharePassword] NVARCHAR (1000) NULL,
    [ShareKeyHash]  INT             NULL,
    [LocationID]    INT             IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY CLUSTERED ([LocationID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);


GO

Create trigger trigger_tsysIPLocations_Insert
on dbo.tsysIPLocations for insert
as 
begin;
	set nocount on;

	-- если создается новый сетевой диапазон, то создаем запись в таблице rCompanyCustLink
	insert into 
		dbo.rCompanyCustLink
		(
			IdIPLocations
		)
		select 
			i.LocationID
		from inserted as i
end;


