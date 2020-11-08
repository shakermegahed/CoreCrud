CREATE TABLE [Website].[Event] (
    [EventId]        UNIQUEIDENTIFIER NOT NULL,
    [EventTitle]     NVARCHAR (255)   NULL,
    [EventTag]       NVARCHAR (150)   NULL,
    [WebsiteId]      UNIQUEIDENTIFIER NULL,
    [CoverImage]     NVARCHAR (50)    NULL,
    [Images]         NVARCHAR (MAX)   NULL,
    [EventDate]      DATETIME         NULL,
    [IsMain]         BIT              CONSTRAINT [DF_Event_IsMain] DEFAULT ((0)) NULL,
    [Description]    NVARCHAR (MAX)   NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              CONSTRAINT [DF_Event_IsDeleted] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED ([EventId] ASC),
    CONSTRAINT [FK_Event_WebSite1] FOREIGN KEY ([WebsiteId]) REFERENCES [Website].[WebSite] ([WebSiteId])
);



