CREATE TABLE [Website].[Category] (
    [CategoryId]     UNIQUEIDENTIFIER NOT NULL,
    [WebSiteId]      UNIQUEIDENTIFIER NULL,
    [parentId]       UNIQUEIDENTIFIER NULL,
    [Title]          NVARCHAR (150)   NULL,
    [CategoryOrder]  INT              NULL,
    [ImageFile]      NVARCHAR (50)    NULL,
    [Description]    NVARCHAR (MAX)   NULL,
    [CategoryLevel]  INT              NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([CategoryId] ASC),
    CONSTRAINT [FK_Category_WebSite] FOREIGN KEY ([WebSiteId]) REFERENCES [Website].[WebSite] ([WebSiteId])
);



