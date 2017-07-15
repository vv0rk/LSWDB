
Create procedure r_procCorrectPrintedPages 
as
/*
	Процедура корректирует принтеры в соответствии с перемещениями принтеров
	это требуется для использования статистики старых принтеров работающих на 
	этом месте
*/

;with c as (
select 
		src.Januar 	as Januar_src
		,src.Februar	as Februar_src
		,src.March 		as March_src
		,src.April 		as April_src
		,src.May 		as May_src
		,src.June 		as June_src
		,src.July 		as July_src
		,src.August 	as August_src
		,src.September  as September_src
		,src.October 	as October_src
		,src.November 	as November_src
		,src.December 	as December_src
		,ms.Januar 	as Januar_tgt
		,ms.Februar	as Februar_tgt
		,ms.March 		as March_tgt
		,ms.April 		as April_tgt
		,ms.May 		as May_tgt
		,ms.June 		as June_tgt
		,ms.July 		as July_tgt
		,ms.August 	as August_tgt
		,ms.September  as September_tgt
		,ms.October 	as October_tgt
		,ms.November 	as November_tgt
		,ms.December 	as December_tgt
		, ms.AssetId as AssetId
from dbo.rMaterialSvod as ms
inner join (
		select 
			 sum (Januar) / cnt as Januar
			,sum (Februar) / cnt as Februar
			,sum (March) / cnt as March
			,sum (April) / cnt as April
			,sum (May) / cnt as May
			,sum (June) / cnt as June
			,sum (July) / cnt as July
			,sum (August) / cnt as August
			,sum (September) / cnt as September
			,sum (October) / cnt as October
			,sum (November) / cnt as November
			,sum (December) / cnt as December
			, Cnt as NumPrint
			, IdAssetTarget
			, IdAssetSource
			, IdTransfer
		from (
			select row_number() over (partition by IdAssetTarget, IdAssetSource order by IdAssetTarget) as RowNumber
				, ms.Januar as Januar
				, ms.Februar as Februar
				, ms.March as March
				, ms.April as April
				, ms.May as May
				, ms.June as June
				, ms.July as July
				, ms.August as August
				, ms.September as September
				, ms.October as October
				, ms.November as November
				, ms.December as December
				, t.Id as IdTransfer
				, tr.Cnt as Cnt
				, ats.IdAssetTarget
				, ats.IdAssetSource 
			from dbo.rAssetTransfer as t 
			inner join dbo.rAssetTransferSpec as ats on t.Id = ats.IdAssetTransfer
			inner join dbo.rMaterialSvod as ms on ats.IdAssetSource = ms.AssetId
			inner join (
					select distinct
					t.Id as IdTransfer
					, count (ats.IdAssetTarget ) as Cnt
					from dbo.rAssetTransfer as t 
					inner join dbo.rAssetTransferSpec as ats on t.Id = ats.IdAssetTransfer
					group by t.Id, ats.IdAssetSource
				) as tr on t.Id = tr.IdTransfer
		) as x
		where x.RowNumber = 1
		group by x.IdAssetTarget, x.IdAssetSource, x.IdTransfer, x.Cnt
) as src on src.IdAssetTarget = ms.AssetId
) update c set
  Januar_tgt = Januar_src
  ,Februar_tgt = Februar_src
  ,March_tgt = March_src
  ,April_tgt = April_src
  ,May_tgt = May_src
  ,June_tgt = June_src
  ,July_tgt = July_src
  ,August_tgt = August_src
  ,September_tgt = September_src
  ,October_tgt = October_src
  ,November_tgt = November_src
  ,December_tgt = December_tgt;
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[r_procCorrectPrintedPages] TO [ie\UIT_USERS]
    AS [dbo];

