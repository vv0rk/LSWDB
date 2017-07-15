CREATE TABLE [dbo].[rTransfer] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [IdScladSource] INT           NOT NULL,
    [IdScladTarget] INT           NOT NULL,
    [Number]        NVARCHAR (20) NOT NULL,
    [Date]          DATETIME      DEFAULT (getdate()) NOT NULL,
    [IdStatus]      INT           NOT NULL,
    [IdUserCreate]  INT           NULL,
    [DateCreation]  DATETIME      DEFAULT (getdate()) NOT NULL,
    [IdUserUpdate]  INT           NULL,
    [DateUpdate]    DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rTransfer_rSclad_IdScladSource_Id] FOREIGN KEY ([IdScladSource]) REFERENCES [dbo].[rSclad] ([Id]),
    CONSTRAINT [FK_rTransfer_rSclad_IdScladTarger_Id] FOREIGN KEY ([IdScladTarget]) REFERENCES [dbo].[rSclad] ([Id]),
    CONSTRAINT [FK_rTransfer_rTransferStatus_Id] FOREIGN KEY ([IdStatus]) REFERENCES [dbo].[rTransferStatus] ([Id]),
    CONSTRAINT [FK_rUser_rTransfer_idUserCreate] FOREIGN KEY ([IdUserCreate]) REFERENCES [dbo].[rUser] ([Id]),
    CONSTRAINT [FK_rUser_rTransfer_idUserUpdate] FOREIGN KEY ([IdUserUpdate]) REFERENCES [dbo].[rUser] ([Id])
);


GO

Create trigger Trigger_rTransfer_Insert on dbo.rTransfer for insert
as
	begin;
		Declare @user nvarchar(100)
		declare @iduser int
		declare @status nvarchar(50)

		set @status = (
			select ts.Status
			from deleted as i
			inner join dbo.rTransferStatus as ts on i.IdStatus = ts.Id )

		if (@status = N'Выполнено') 
			begin;
				rollback transaction
			end;



		set @user = USER_NAME()
		if not exists (select * from dbo.rUser as u where u.UserName = @user ) 
			begin;
				Insert into dbo.rUser (UserName) values ( @user )
			end;

		set @iduser = (select u.Id from dbo.rUser as u where u.UserName = @user);

		with c as (
			select 
				t.IdUserCreate as UserCreate,
				t.IdUserUpdate as UserUpdate
			from inserted as i
			inner join dbo.rTransfer as t on i.Id = t.Id
		) update c set
		UserCreate = @iduser,
		UserUpdate = @iduser;
	end;


GO

Create trigger Trigger_rTransfer_Update on dbo.rTransfer for Update
as
	begin;
		Declare @user nvarchar(100)
		declare @iduser int
		declare @idusercreate int

		------------ часть кода зависящая от статуса -------------
 		declare @status nvarchar(50)

		set @status = (
			select ts.Status
			from deleted as i
			inner join dbo.rTransferStatus as ts on i.IdStatus = ts.Id )

		if (@status = N'Выполнено') 
			begin;
				rollback transaction
			end;
		------------ часть кода зависящая от статуса -------------

		set @user = USER_NAME();
		if not exists (select * from dbo.rUser as u where u.UserName = @user ) 
			begin;
				Insert into dbo.rUser (UserName) values ( @user )
			end;

		set @iduser = (select u.Id from dbo.rUser as u where u.UserName = @user);

		set @idusercreate = (select d.IdUserCreate from deleted as d );
		if @idusercreate is null
			begin;
				set @idusercreate = @iduser
			end;

		with c as (
			select 
				t.IdUserCreate as UserCreate,
				t.IdUserUpdate as UserUpdate
			from inserted as i
			inner join deleted as d on i.Id = d.Id
			inner join dbo.rTransfer as t on i.Id = t.Id
		) update c set
		UserCreate = @IdUserCreate,
		UserUpdate = @idUser;
	end;


GO
GRANT DELETE
    ON OBJECT::[dbo].[rTransfer] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rTransfer] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rTransfer] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rTransfer] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[rTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT CONTROL
    ON OBJECT::[dbo].[rTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[rTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW DEFINITION
    ON OBJECT::[dbo].[rTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT VIEW CHANGE TRACKING
    ON OBJECT::[dbo].[rTransfer] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[rTransfer] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[rTransfer] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[rTransfer] TO [IE\UIT_USERS_VR]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[rTransfer] TO [IE\UIT_USERS_VR]
    AS [dbo];

