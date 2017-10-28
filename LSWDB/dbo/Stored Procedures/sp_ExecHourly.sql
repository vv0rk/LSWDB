CREATE PROCEDURE [dbo].[sp_ExecHourly]
AS

-- обновляем ФИО пользователя, должность пользователя, Departament данными из rEmployee
-- поле login является ключем для связи.

with c as (
    select 
    ac.Custom17 as login_tgt
    , e.Login
    , ac.Custom11 as FIO_tgt
    , e.Name as FIO_src
    , ac.custom10 as JT_tgt
    , e.JobTitle as JT_src
    , ac.Department as Dep_tgt
    , e.Departament as Dep_src


    from tblAssetCustom as ac 
    inner join fn_getEmployeeSplited() as e on ac.Custom17 = e.login
    Where (ac.Custom17 is not null and ac.Custom17 not like '') and (ac.Custom17 like '%\%' and e.removed = 0) and
    (ac.Custom11 not like e.Name or ac.custom10 not like e.JobTitle or ac.Department not like e.Departament)
) update c set
FIO_tgt = FIO_src,
JT_tgt = JT_src,
Dep_tgt = Dep_src;


-- обновляет данные на подчиненных ассетах
with C as (     
		select       
			a.AssetName as src_AssetName, 		
			a.AssetTypename as src_AssetType,         
			a1.AssetName as tgt_AssetName, 		
			at.assetTypename as tgt_AssetType,  		
			a.custom1 as src_Org, 		
			a.custom2 as src_Gorod, 		
			a.custom3 as src_Adres, 		
			a.custom4 as src_Office, 		
			a.custom5 as src_place, 		
			a.custom10 as src_Position, 		
			a.custom11 as src_FIO, 
			a.custom17 as src_Login,
			a.custom19 as src_VT,  		
			ac.custom1 as tgt_Org, 		
			ac.custom2 as tgt_Gorod, 		
			ac.custom3 as tgt_Adres, 		
			ac.custom4 as tgt_Office, 		
			ac.custom5 as tgt_place, 		
			ac.custom10 as tgt_Position, 		
			ac.custom11 as tgt_FIO,
			ac.custom17 as tgt_Login, 
			ac.custom19 as tgt_VT       
		from ( 		
			select 			
				a.AssetID as AssetID, 			
				a.AssetName as Assetname, 			
				at.AssetTypename as AssetTypename, 			
				ac.custom1 as Custom1, 			
				ac.custom2 as Custom2, 			
				ac.custom3 as Custom3, 			
				ac.custom4 as Custom4, 			
				ac.custom5 as Custom5, 			
				ac.custom10 as Custom10, 
				ac.custom11 as Custom11, 
				ac.custom17 as Custom17,
				ac.custom19 as Custom19  		
			from dbo.tblAssets as A 		
			inner join dbo.tblAssetCustom as AC on a.AssetID = ac.AssetID 		
			inner join dbo.tsysAssetTypes as AT on a.Assettype = at.AssetType 		
			where at.AssetTypename = 'Windows' 
		) as A 	
		left join dbo.tblAssetRelations as AR on a.AssetID = AR.ParentAssetID 	
		inner join dbo.tblAssets as A1 on ar.ChildAssetID = a1.AssetID 	
		inner join dbo.tblAssetCustom as AC on a1.AssetID = ac.assetid 	
		inner join dbo.tsysAssetTypes as AT on a1.Assettype = at.AssetType  	
		where (at.AssetTypename = 'Monitor' or at.AssetTypename = 'Printer' or at.AssetTypename = 'UPS' or at.AssetTypename = 'APC' or at.AssetTypename = 'VOIP phone') 	
	) 	
	Update C set 
	tgt_Org = src_Org, 
	tgt_Gorod = src_Gorod, 
	tgt_Adres = src_Adres, 
	tgt_Office = src_Office, 
	tgt_place = src_place, 
	tgt_Position = src_Position, 
	tgt_FIO = src_FIO, 
	tgt_Login = src_Login,
	tgt_VT = src_VT;

	

RETURN 0
