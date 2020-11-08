CREATE TABLE [dbo].[FileUpload] (
    [FileId]         UNIQUEIDENTIFIER NOT NULL,
    [FileName]       NVARCHAR (100)   NULL,
    [FileTitle]      NVARCHAR (100)   NULL,
    [FileSize]       FLOAT (53)       NULL,
    [EntityType]     INT              NULL,
    [EntityId]       UNIQUEIDENTIFIER NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              NULL,
    CONSTRAINT [PK_FileUpload] PRIMARY KEY CLUSTERED ([FileId] ASC)
);







