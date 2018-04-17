/*
Идентификаторы Личной карточки
Идентификатор ЛК меняется, когда производится операция над ассетами
Идентификатоо 
*/

CREATE TABLE [dbo].[rHScladIdHistory]
(
	[Id] BIGINT NOT NULL PRIMARY KEY Identity(1,1), 
    [Name] NVARCHAR(10) NULL
)
