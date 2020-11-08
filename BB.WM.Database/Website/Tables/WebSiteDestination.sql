CREATE TABLE [Website].[WebSiteDestination] (
    [WebsiteDestinationId] UNIQUEIDENTIFIER NOT NULL,
    [WebSiteId]            UNIQUEIDENTIFIER NULL,
    [ParentId]             UNIQUEIDENTIFIER NULL,
    [DestinationId]        UNIQUEIDENTIFIER NULL,
    [DestinationImages]    NVARCHAR (MAX)   NULL,
    [Description]          NVARCHAR (MAX)   NULL,
    [CreatedOn]            DATETIME         NOT NULL,
    [CreatedBy]            UNIQUEIDENTIFIER NULL,
    [LastModifiedOn]       DATETIME         NULL,
    [LastModifiedBy]       UNIQUEIDENTIFIER NULL,
    [IsDeleted]            BIT              NULL,
    CONSTRAINT [PK_WebSiteDestination] PRIMARY KEY CLUSTERED ([WebsiteDestinationId] ASC),
    CONSTRAINT [FK_WebSiteDestination_WebSite] FOREIGN KEY ([WebSiteId]) REFERENCES [Website].[WebSite] ([WebSiteId]) ON DELETE CASCADE
);



