/*
	процедура отмечает текущее состояние техники
	делаются записи только для измененной техники
	состояния берутся последние перед текущей датой
	поля для которых фикс изменения:
	State
	Org, Filial, Gorod, Address, Office

*/
--CREATE PROCEDURE [dbo].[sp_PlanGetCurrentState]
--AS
--	SELECT @param1, @param2
--RETURN 0
