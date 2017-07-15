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

Create trigger Trigger_rMaterialAnalog_Insert on dbo.rMaterialAnalog instead of insert
as
	begin;
		insert into dbo.rMaterialAnalog
		(
			IdManufacturer
			, PartNumber
			, Name
			, Resource
			, AltName
		)
		select 
			i.IdManufacturer
			, i.PartNumber
			, i.Name
			, i.Resource
			, CONCAT(m.ShortName, ' ', i.PartNumber)
		from inserted as i 
		inner join dbo.rManufacturer as m on i.IdManufacturer = m.Id
	end;


GO

Create trigger Trigger_rMaterialAnalog_Update on dbo.rMaterialAnalog after update
as
	begin;

		update ma set AltName = CONCAT(m.ShortName, ' ', i.PartNumber)
		from dbo.rMaterialAnalog as ma 
		inner join inserted as i on i.Id = ma.Id
		inner join dbo.rManufacturer as m on i.IdManufacturer = m.Id
	end;

