CREATE TABLE [dbo].[rModelLink] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [ModelAsset] NVARCHAR (255) NULL,
    [ModelSprav] NVARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_rModelLink_rModelDevice_Model] FOREIGN KEY ([ModelSprav]) REFERENCES [dbo].[rModelDevice] ([Model]) ON UPDATE CASCADE,
    CONSTRAINT [AK_ModelAsset] UNIQUE NONCLUSTERED ([ModelAsset] ASC) WITH (FILLFACTOR = 90)
);


GO

-- =============================================
-- Author:		<Author,Savin,Nikolay>
-- Create date: <Create Date,25/12/2016,>
-- Description:	<Когда добавляем запись в таблицу rModelLink обновляются Custom9 в таблицах tblAssetCustom и rAsset для всех где совпадают
-- rModelLink.ModelAsset и tblAssetCustom.Model>
-- =============================================
CREATE trigger [dbo].[trigger_rModelLink_update]
on [dbo].[rModelLink] for update
as
begin
	-- set nocount on added to prevent extra result sets from
	-- interfering with select statements.
	set nocount on;

	select *
	from inserted
--with c as (
--	select 
--		ac.AssetID,
--		ac.Model,
--		ac.Custom9 as Custom9_tgt,
--		ml.ModelAsset as Custom9_check,
--		ml.ModelSprav as Custom9_src
	
--	from inserted as ml 
--	inner join dbo.tblAssetCustom as ac on ml.ModelAsset =ac.Model 
--)
--update c set 
--Custom9_tgt = Custom9_src;

--with c as (
--	select 
--		ac.AssetID,
--		ac.Model,
--		ac.Custom9 as Custom9_tgt,
--		ml.ModelAsset as Custom9_check,
--		ml.ModelSprav as Custom9_src
	
--	from dbo.rModelLink as ml 
--	inner join dbo.rAsset as ac on ml.ModelAsset =ac.Model 
--)
--update c set 
--Custom9_tgt = Custom9_src;

end
