CREATE TABLE [Website].[Brand] (
    [BrandId]        UNIQUEIDENTIFIER NOT NULL,
    [BrandName]      NVARCHAR (50)    NULL,
    [ImageFile]      NVARCHAR (50)    NULL,
    [BrandOrder]     INT              NULL,
    [BrandLink]      NVARCHAR (MAX)   NULL,
    [WebsiteId]      UNIQUEIDENTIFIER NOT NULL,
    [Description]    NVARCHAR (MAX)   NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              NULL,
    CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED ([BrandId] ASC),
    CONSTRAINT [FK_Brand_WebSite] FOREIGN KEY ([WebsiteId]) REFERENCES [Website].[WebSite] ([WebSiteId]) ON DELETE CASCADE
);



