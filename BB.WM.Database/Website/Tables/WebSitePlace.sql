CREATE TABLE [Website].[WebSitePlace] (
    [WebSitePlaceId] UNIQUEIDENTIFIER NOT NULL,
    [WebSiteId]      UNIQUEIDENTIFIER NULL,
    [ParentId]       UNIQUEIDENTIFIER NULL,
    [PlaceId]        UNIQUEIDENTIFIER NULL,
    [PlaceImages]    NVARCHAR (MAX)   NULL,
    [Description]    NVARCHAR (MAX)   NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              NULL,
    CONSTRAINT [PK_WebSitePlace] PRIMARY KEY CLUSTERED ([WebSitePlaceId] ASC),
    CONSTRAINT [FK_WebSitePlace_Place] FOREIGN KEY ([PlaceId]) REFERENCES [dbo].[Place] ([PlaceId]) ON DELETE CASCADE,
    CONSTRAINT [FK_WebSitePlace_WebSite] FOREIGN KEY ([WebSiteId]) REFERENCES [Website].[WebSite] ([WebSiteId]) ON DELETE CASCADE
);







