CREATE TABLE [Travel].[Entertainment] (
    [EntertainmentId]      UNIQUEIDENTIFIER NOT NULL,
    [Name]                 NVARCHAR (100)   NULL,
    [Location]             NVARCHAR (100)   NULL,
    [Description]          NVARCHAR (MAX)   NULL,
    [images]               NVARCHAR (MAX)   NULL,
    [WebSiteDestinationId] UNIQUEIDENTIFIER NULL,
    [CreatedOn]            DATETIME         NOT NULL,
    [CreatedBy]            UNIQUEIDENTIFIER NULL,
    [LastModifiedOn]       DATETIME         NULL,
    [LastModifiedBy]       UNIQUEIDENTIFIER NULL,
    [IsDeleted]            BIT              NULL,
    CONSTRAINT [PK_Entertainment] PRIMARY KEY CLUSTERED ([EntertainmentId] ASC),
    CONSTRAINT [FK_Entertainment_WebSiteDestination] FOREIGN KEY ([WebSiteDestinationId]) REFERENCES [Website].[WebSiteDestination] ([WebsiteDestinationId]) ON DELETE CASCADE
);

