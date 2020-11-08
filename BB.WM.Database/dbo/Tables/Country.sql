CREATE TABLE [dbo].[Country] (
    [CountryId]      UNIQUEIDENTIFIER NOT NULL,
    [Name]           NVARCHAR (50)    NULL,
    [Flag]           NVARCHAR (50)    NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              CONSTRAINT [DF_Country_IsDeleted] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([CountryId] ASC)
);





