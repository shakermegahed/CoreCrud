CREATE TABLE [Website].[WebSiteRestaurant] (
    [WebSiteRestaurantId] UNIQUEIDENTIFIER NOT NULL,
    [WebSiteId]           UNIQUEIDENTIFIER NULL,
    [ParentId]            UNIQUEIDENTIFIER NULL,
    [RestaurantId]        UNIQUEIDENTIFIER NULL,
    [RestaurantImages]    NVARCHAR (MAX)   NULL,
    [Description]         NVARCHAR (MAX)   NULL,
    [RestaurantLogo]      NVARCHAR (100)   NULL,
    [PriceRange]          NVARCHAR (50)    NULL,
    [Rate]                FLOAT (53)       NULL,
    [WebsiteLink]         NVARCHAR (200)   NULL,
    [CreatedOn]           DATETIME         NOT NULL,
    [CreatedBy]           UNIQUEIDENTIFIER NULL,
    [LastModifiedOn]      DATETIME         NULL,
    [LastModifiedBy]      UNIQUEIDENTIFIER NULL,
    [IsDeleted]           BIT              NULL,
    CONSTRAINT [PK_WebSiteRestaurant] PRIMARY KEY CLUSTERED ([WebSiteRestaurantId] ASC),
    CONSTRAINT [FK_WebSiteRestaurant_Restaurant] FOREIGN KEY ([RestaurantId]) REFERENCES [dbo].[Restaurant] ([RestaurantId]) ON DELETE CASCADE,
    CONSTRAINT [FK_WebSiteRestaurant_WebSite] FOREIGN KEY ([WebSiteId]) REFERENCES [Website].[WebSite] ([WebSiteId]) ON DELETE CASCADE
);







