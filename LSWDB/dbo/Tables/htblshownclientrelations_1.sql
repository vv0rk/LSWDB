CREATE TABLE [dbo].[htblshownclientrelations] (
    [RelationTypeID] INT NOT NULL,
    CONSTRAINT [PK_htblshownclientrelations] PRIMARY KEY CLUSTERED ([RelationTypeID] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_htblshownclientrelations_tsysAssetRelationTypes] FOREIGN KEY ([RelationTypeID]) REFERENCES [dbo].[tsysAssetRelationTypes] ([RelationTypeID]) ON DELETE CASCADE
);

