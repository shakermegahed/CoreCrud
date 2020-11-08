CREATE TABLE [Website].[Project] (
    [ProjectId]      UNIQUEIDENTIFIER NOT NULL,
    [ProjectTitle]   NVARCHAR (255)   NULL,
    [ProjectTag]     NVARCHAR (50)    NULL,
    [ProjectLink]    NVARCHAR (150)   NULL,
    [ProjectOrder]   INT              NULL,
    [CoverImage]     NVARCHAR (150)   NULL,
    [Images]         NVARCHAR (MAX)   NULL,
    [WebsiteId]      UNIQUEIDENTIFIER NULL,
    [Description]    NVARCHAR (MAX)   NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              CONSTRAINT [DF_Project_IsDeleted] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED ([ProjectId] ASC)
);





