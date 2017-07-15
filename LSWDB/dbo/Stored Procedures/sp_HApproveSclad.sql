
create PROCEDURE [dbo].sp_HApproveSclad
	@idScl int = NULL
AS
	Declare @idStatus int = null;
	
	Select @idStatus = s.idStatus
			from rHSclad as s
			Where s.Id = @idScl;

	IF @idStatus = 2
		begin
			raiserror(N'Состояние хранилища подтверждено',10,1);
			return 1;
		end

	-- если состояние хранилища не было подтверждено ранее, то 
	-- подтверждаем состояние
	update rHSclad
		set idStatus = 2
	Where id = @idScl;

	-- теперь подтверждаем все неподтвержденные записи в журнале для которых
	-- на все хранилища подтверждены и хотя бы одино из хранилищ @idScl

	with c as (
		select 
			--rHJournal.Id
			--, rHJournal.idAsset
			j.idStatus as tgt
		from rHJournal as j
		inner join rHSclad as s1 on j.idScl1 = s1.Id
		left join rHSclad as s2 on j.idScl2 = s2.Id
		Where j.idStatus = 1 and s1.Id = @idScl and (s2.idStatus = 2 or s2.idStatus is null)
	) update c set
		 tgt = 2;


	with c as (
		select 
			--j.Id
			--, j.idAsset
			j.idStatus as s_tgt
		from rHJournal as j
		inner join rHSclad as s2 on j.idScl2 = s2.Id
		left join rHSclad as s1 on j.idScl1 = s1.Id
		Where j.idStatus = 1 and s2.Id = @idScl and (s1.idStatus = 2 or s1.idStatus is null) 
	) update c set
		s_tgt = 2;

	
		
		
RETURN 0