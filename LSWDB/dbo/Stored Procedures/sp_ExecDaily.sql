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

RETURN 0
