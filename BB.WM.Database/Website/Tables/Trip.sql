CREATE TABLE [Website].[Trip] (
    [TripId]           UNIQUEIDENTIFIER NOT NULL,
    [WebSiteId]        UNIQUEIDENTIFIER NULL,
    [TripTitle]        NVARCHAR (150)   NULL,
    [Duration]         NVARCHAR (MAX)   NULL,
    [Overview]         NVARCHAR (MAX)   NULL,
    [TripDestinations] NVARCHAR (MAX)   NULL,
    [TripPlaces]       NVARCHAR (MAX)   NULL,
    [Itinerary]        NVARCHAR (MAX)   NULL,
    [Price]            DECIMAL (18, 2)  NULL,
    [Images]           NVARCHAR (MAX)   NULL,
    [PdfName]          NVARCHAR (100)   NULL,
    [CreatedOn]        DATETIME         NOT NULL,
    [CreatedBy]        UNIQUEIDENTIFIER NULL,
    [LastModifiedOn]   DATETIME         NULL,
    [LastModifiedBy]   UNIQUEIDENTIFIER NULL,
    [IsDeleted]        BIT              NULL,
    CONSTRAINT [PK_Trip] PRIMARY KEY CLUSTERED ([TripId] ASC),
    CONSTRAINT [FK_Trip_WebSite] FOREIGN KEY ([WebSiteId]) REFERENCES [Website].[WebSite] ([WebSiteId])
);







