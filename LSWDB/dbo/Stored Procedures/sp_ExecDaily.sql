CREATE PROCEDURE [dbo].[sp_ExecDaily]
AS
	
	-- пишет данные о количестве отпечатков в журнал
	insert into dbo.rPrintHist 
		( 
			AssetId, 
			Company, 
			City, 
			[Address], 
			Officenr, 
			Placenr, 
			datecheck, 
			Printedpages
		)   
	select 
		a.AssetID, 
		ac.Custom1, 
		ac.Custom2, 
		ac.Custom3, 
		ac.Custom4, 
		ac.Custom5, 
		a.Lastseen, 
		ac.Printedpages 
	from dbo.tblAssets as a  
	inner join dbo.tblAssetCustom as ac on a.AssetID = ac.AssetID  
	inner join dbo.tsysAssetTypes as at on a.Assettype = at.AssetType  
	left join ( 	
			select 	
				ph.AssetId as AssetId, 	
				FIRST_VALUE(ph.datecheck) over (partition by ph.AssetID order by ph.datecheck desc) as Lastseen, 	
				first_value(ph.printedpages) over (partition by ph.AssetID order by ph.datecheck desc) as Printedpages, 	
				row_number() over (partition by ph.AssetID order by ph.datecheck desc) as nr 	
			from dbo.rPrintHist as ph  
		) as ph on a.AssetID = ph.AssetId  
	where at.AssetTypename = 'Printer' and (ac.Printedpages <> ph.Printedpages or ph.AssetId is null )

	-- добавлено Савин Н.В. 18.08.2017 6:00
	-- создаем личные карточки для вновь появившихся сотрудников
	-- только сотрудников у которых имеется логин
	insert into dbo.rHSclad (idResponce, idType, idCompany )
	select 
		e.id
		, 0
		, c.id
	from rEmployee as e 
	inner join (
			select * from rCompany$  where rCompany$.isOrg = 1 ) as c on e.organization = c.IdOU
	left join rHSclad as s on e.id = s.idResponce
	where s.Id is null and e.login is not null and e.removed = 0

RETURN 0
