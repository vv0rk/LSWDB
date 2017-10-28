/*
	процедура нужна для подтверждения состояния склада по существующей личной карточке
	склад на момент вызова процедуры известен и есть личная карточка.
	Нажимаю кнопку и перевожу склад в состояние 2 (Утверждено)

	Подтверждение производится когда я получаю подписанную личную карточку.
	нажимая подтвердить я принимаю ответственность что все проверено и мною согласовано!

	Разрешаем подтверждение ЛК только для Поневежского и меня, все остальные нахуй

	Передача А от П1 к П2


*/

create PROCEDURE [dbo].sp_HApproveSclad
	@idScl int = NULL
AS
	Declare @idStatus int = null;
	Declare @userApprove nvarchar(255);
	
	SELECT @userApprove = SYSTEM_USER

	IF @userApprove not like '%savin%' and @userApprove not like '%poneveg%' and @userApprove not like '%nikky%' and @userApprove not like '%debug%' 
		begin
			raiserror( N'Вы не имеете права подтверждать перемещение. Обратитесь в ОУИТа', 13, 1);
			return 1;
		end

	Select @idStatus = s.idStatus
			from rHSclad as s
			Where s.Id = @idScl;

	--IF @idStatus = 2
	--	begin
	--		raiserror(N'Состояние хранилища подтверждено',10,1);
	--		return 1;
	--	end

	-- если состояние хранилища не было подтверждено ранее, то 
	-- подтверждаем состояние, подтверждаем состояние склада
	update rHSclad
		set idStatus = 2
	Where id = @idScl;

	-- теперь подтверждаем все неподтвержденные записи в журнале для которых
	-- не все хранилища подтверждены и хотя бы одино из хранилищ @idScl


	/*
		Если мы принимаем карточку.
		В журнале принимаем все не 

		Передача А от П1 к П2

		А зарегистрирован на @idScl = П2
	*/

	/*
		берем все записи журнала где этот склад 
		ИСТОЧНИК
		и одобряем все эти записи
		ОШИБКА!!!
		оборудование еще не пришло на приемник а мы уже утвердили перемещение!!!!
		РЕШЕНИЕ
		ОТКЛЮЧАЕМ ЭТУ ЧАСТЬ ПРОЦЕДУРЫ
	*/
	/*
	with c as (
		select 
			--rHJournal.Id
			--, rHJournal.idAsset
			j.idStatus as tgt
		from rHJournal as j
		-- source sclad. Склад источник
		inner join rHSclad as s1 on j.idScl1 = s1.Id
		-- target sclad
		left join rHSclad as s2 on j.idScl2 = s2.Id
		Where j.idStatus = 1 and s1.Id = @idScl and (s2.idStatus = 1 or s2.idStatus = 3 or s2.idStatus is null)
	) update c set
		 tgt = 2;
	*/


	/*
		берем все записи журнала где этот склад 
		ПРИЕМНИК
		и одобряем все эти записи
	*/
	with c as (

		select 
			--j.Id
			--, j.idAsset
			j.idSclStatus2 as s_tgt,
			j.idStatus as t_tgt
			from rHSclad as r
			inner join rAssetsImported as ai on r.Id = ai.idScl
			inner join rHJournal as j on r.Id = j.idScl2 and ai.id = j.idAsset
			where j.idScl2 = @idscl 
		--) 
	) update c set
		s_tgt = 2,
		t_tgt = 2
		;

		
RETURN 0
