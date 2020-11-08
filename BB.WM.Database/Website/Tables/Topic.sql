CREATE TABLE [Website].[Topic] (
    [TopicId]        UNIQUEIDENTIFIER NOT NULL,
    [WebSiteId]      UNIQUEIDENTIFIER NULL,
    [TopicTitle]     NVARCHAR (200)   NULL,
    [TopicTag]       NVARCHAR (200)   NULL,
    [TopicContent]   NVARCHAR (MAX)   NULL,
    [ImageFile]      NVARCHAR (50)    NULL,
    [TopicDate]      DATETIME         NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              NULL,
    CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED ([TopicId] ASC),
    CONSTRAINT [FK_Topic_WebSite] FOREIGN KEY ([WebSiteId]) REFERENCES [Website].[WebSite] ([WebSiteId]) ON DELETE CASCADE
);


