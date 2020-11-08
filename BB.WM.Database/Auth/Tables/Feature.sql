CREATE TABLE [Auth].[Feature] (
    [FeatureId]      UNIQUEIDENTIFIER NOT NULL,
    [Code]           NVARCHAR (50)    NULL,
    [Name]           NVARCHAR (100)   NULL,
    [Description]    NVARCHAR (1000)  NULL,
    [Status]         INT              NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              NULL,
    CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED ([FeatureId] ASC)
);

