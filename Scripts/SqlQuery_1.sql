use lansweeperdb;

go



--exec sp_PlanFirstStart
--exec sp_PlanFixFact 
--exec sp_PlanStart

--exec sp_PlanCreateOnDate @tDate = '20180101', @cDate = '20170801'
--exec sp_PlanCreateOnDate @tDate = '20180401', @cDate = '20180101'
--exec sp_PlanCreateOnDate @tDate = '20180701', @cDate = '20180401'
--exec sp_PlanCreateOnDate @tDate = '20181001', @cDate = '20180901'
--План по состоянию оборудования создан
-- создаем план по РМ 
-- по состоянию оборудования формируем перечень номенклатуры в таблице rPlanRMTimeSheet
--exec sp_PlanRMCreateOnDate @tDate = '20171001'
--exec sp_PlanRMCreateOnDate @tDate = '20180101'
--exec sp_PlanRMCreateOnDate @tDate = '20180401'
--exec sp_PlanRMCreateOnDate @tDate = '20180701'
--exec sp_PlanRMCreateOnDate @tDate = '20181001'

--Alter table rMaterialRashod add Constraint FK_rMaterialRashod_rSclad_IdSclad foreign key (IdSclad)
--			References rSclad(Id)

--select * from fn_getComplectRMAnalog( 25105)

			--select 
			--	--ma.Id,
			--	--ma.PartNumber,
			--	ac.AssetID
			--from tblAssetCustom as ac
			--inner join rModelDevice as md on ac.custom9 = md.Model
			--inner join rModelComplect as mc on md.Id = mc.IdModel
			--inner join rModelComplectStatus as ms on mc.IdStatus = ms.Id
			--inner join rMaterialOriginal as mo on mc.IdMaterialOriginal = mo.Id
			--inner join rMaterialAnalog as ma on mo.PartNumber = ma.PartNumber
			--where ac.AssetID = 1589 -- and ms.Status like N'ДА' 
--===========================================================================
--========= отрабатывается скрипт из бд access по запросу в ручном режиме ===
-- дополнение справочника Аналогов включить в ежедневное обновление
--insert into rMaterialAnalog (PartNumber, Name, Resource)
--select 
--	o.PartNumber,
--	o.Name,
--	o.Resource
--from rMaterialOriginal as o
--where not exists (
--	select *
--	from rMaterialAnalog as a 
--	where o.PartNumber = a.PartNumber
--)

--insert into dbo.rMaterialLink ( IdOriginal, IdAnalog )
--select 
--	o.Id,
--	a.Id
--from rMaterialOriginal as o
--inner join rMaterialAnalog  as a on o.PartNumber = a.PartNumber
--Where not exists (
--	select *
--	from rMaterialLink as l
--	where l.IdAnalog = a.Id and l.IdOriginal = o.Id
--)
--===========================================================================
--===========================================================================

--Select id, partNumber 
--        From fn_getComplectRMAnalog(NULL) as a
--        Where a.AssetId = 20314

--select 	o.PartNumber
--from rMaterialOriginal as o
--left join rMaterialAnalog as a on o.PartNumber = a.PartNumber
--where a.Id is null

-- 343 аналоговых материалов
--select *
--from rMaterialAnalog as a 

-- 356 link
--select * 
--from rMaterialLink as l

--select * 
--from tblAssetCustom as ac
--inner join rModelDevice as md on ac.Custom9 = md.Model
--inner join rModelComplect as mc on md.Id = mc.Id
--inner join rMaterialOriginal as mo on mc.IdMaterialOriginal = mo.Id
--inner join rModelComplectStatus as ms on mc.IdStatus = ms.Id
--where ms.Status = N'ДА' and 


-- В соответствии с алгоритмом обновляем значение прогноза
--Declare @tDate datetime = '20180401';

--update dbo.rPlanRMTimeSheet
--Set
--	dbo.rPlanRMTimeSheet.Quantity = dbo.fn_getPrognozRMalgoritm(p.AssetId, p.idMaterialOriginal, @tDate)
--from rPlanRMTimeSheet as p
--inner join tblAssets as a on p.AssetId = a.AssetID
--inner join tsysAssetTypes as t on a.Assettype = t.AssetType
--Where t.AssetTypename like N'Printer' and dbo.fn_getDateStandart(p.Date) = @tDate

----Declare @tDate datetime = '20180401';

----select 
----	p.AssetId,
----	p.idMaterialOriginal,
----	p.Quantity as N'Кол-во инит',
----	dbo.fn_getPrognozRMalgoritm(p.AssetId, p.idMaterialOriginal, @tDate) as N'Прогноз'
----from rPlanRMTimeSheet as p
----inner join tblAssets as a on p.AssetId = a.AssetID
----inner join tsysAssetTypes as t on a.Assettype = t.AssetType
----Where t.AssetTypename like N'Printer' and dbo.fn_getDateStandart(p.Date) = @tDate

--declare @res int = null;
--declare @tDate datetime = '20180101';
--declare @AssetId int = 21163;
--declare @idMaterialOriginal int = 33;

--set @res = dbo.fn_getPrognozRMalgoritm(@AssetId, @idMaterialOriginal, @tDate);

--print @res;