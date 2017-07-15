

/*
	хранимые процедуры по которым производится движение оборудования по ЛК
*/


/*
	Хранилище фиксируется в rAssetsImported столбец rScl
	функция для внесения данных о перемещении в журнал
	idAsset - идентификатор записи в rAssetsImported
	idScl1 - это атрибуты источника
	idScl2 - это атрибуты назначения
*/
CREATE procedure sp_HTransfer (	
									@idAsset int = NULL, 
									@idScl2 int = NULL
									)

AS
	BEGIN
		declare @idScl1 int;
		declare @idJprev int;
		declare @idJ int;
		declare	@userCreate nvarchar(255) = NULL;
		declare @dateCreate datetime = NULL;
		declare @sclStatus1 int = NULL;
		declare @sclStatus2 int = null;

		SELECT @userCreate = SYSTEM_USER, @dateCreate = GETDATE()


		-- проверка условия целевой склад или асет не могут отсутствовать
		IF @idScl2 is null or @idAsset is null
			BEGIN
				PRINT N'Назначение и Ассет не могут быть NULL';
				Raiserror ( N'Целевое хранилище и асет должны быть определены при перемещении!', 18, 1);
				return 1;
			END

		-- контроль связанности записей в журнале, должна быть определена цепочка событий для 
		-- находим идентификатор записи спецификации для данного асета
		-- проверяем, что запись в журнале с параметрами @idAsset, @idScl2 существует
		set @idScl1 = (select ai.idScl 
							from rAssetsImported as ai 
							where ai.id = @idAsset);

		-- последняя запись в журнале
		set @idJPrev = (select ai.idJournal 
							from rAssetsImported as ai 
							where ai.id = @idAsset);
		-- RAISERROR (N'@idJPrev %u', 11, 1, @idJPrev);

		IF @idScl1 = @idScl2 
			begin
				RAISERROR (N'Перемещение одного ассета между одним хранилищем %u', 18, 5, @idScl1);
				return 1;
			end

		declare @Statusprev int;

		-- проверка статуса предыдущей записи
		Select @Statusprev = j.idStatus
			from dbo.rHJournal as j
			Where j.Id = @idJprev;

		IF @Statusprev = 1 
			begin
				raiserror (N'Предыдущее перемещение не было одобрено!', 18, 5);
				return 1;
			end

		-- текущий статус хранилищ для фиксирования в журнале
		Select @sclStatus1 = s.idStatus
			from rHSclad as s 
			Where s.id = @idScl1;

		Select @sclStatus2 = s.idStatus
			from rHSclad as s 
			Where s.id = @idScl2;


		IF @idJprev is null
			BEGIN
				INSERT INTO dbo.rHJournal( idAsset, idScl1, idSclStatus1, idScl2, idSclStatus2, idStatus, userCreate, dateCreate)
				VALUES (@idAsset, @idScl1, @sclStatus1,  @idScl2, @sclStatus2, 1,  @userCreate, @dateCreate)
			END
		ELSE
			BEGIN
				INSERT INTO dbo.rHJournal( idAsset, idScl1, idSclStatus1, idScl2, idSclStatus2, idJprev, idStatus, userCreate, dateCreate)
				VALUES (@idAsset, @idScl1, @sclStatus1, @idScl2, @sclStatus2, @idJprev, 1,  @userCreate, @dateCreate)
			END
		Select @idJ = @@IDENTITY

		-- обновляем хранилище у асета и устанавливаем ссылку 
		update dbo.rAssetsImported 
		SET idScl = @idScl2,
			idJournal = @idJ
		Where dbo.rAssetsImported.id = @idAsset

		-- меняем статус у хранилищ, которые участвовали в обмене 
		-- ЛК не одобрена. ЛК одобряется в sp_HApprove
		update dbo.rHSclad
		SET idStatus = 3
		Where dbo.rHSclad.Id = @idScl2

		update dbo.rHSclad
		SET idStatus = 3
		Where dbo.rHSclad.Id = @idScl1

		return 0;
	END;