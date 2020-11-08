CREATE TABLE [Website].[WebSiteHotel] (
    [WebSiteHotelId] UNIQUEIDENTIFIER NOT NULL,
    [WebSiteId]      UNIQUEIDENTIFIER NULL,
    [HotelId]        UNIQUEIDENTIFIER NULL,
    [parentId]       UNIQUEIDENTIFIER NULL,
    [HotelImages]    NVARCHAR (MAX)   NULL,
    [Description]    NVARCHAR (MAX)   NULL,
    [MapURL]         NVARCHAR (150)   NULL,
    [HotelLogo]      NVARCHAR (100)   NULL,
    [Stars]          FLOAT (53)       NULL,
    [WebsiteLink]    NVARCHAR (250)   NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              NULL,
    CONSTRAINT [PK_WebSiteHotel] PRIMARY KEY CLUSTERED ([WebSiteHotelId] ASC),
    CONSTRAINT [FK_WebSiteHotel_Hotel] FOREIGN KEY ([HotelId]) REFERENCES [dbo].[Hotel] ([HotelId]) ON DELETE CASCADE,
    CONSTRAINT [FK_WebSiteHotel_WebSite] FOREIGN KEY ([WebSiteId]) REFERENCES [Website].[WebSite] ([WebSiteId]) ON DELETE CASCADE
);







