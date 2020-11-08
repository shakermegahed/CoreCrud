CREATE TABLE [Website].[Service] (
    [ServiceId]      UNIQUEIDENTIFIER NOT NULL,
    [WebSiteId]      UNIQUEIDENTIFIER NULL,
    [parentId]       UNIQUEIDENTIFIER NULL,
    [Title]          NVARCHAR (150)   NULL,
    [ServiceOrder]   INT              NULL,
    [ImageFile]      NVARCHAR (50)    NULL,
    [Description]    NVARCHAR (MAX)   NULL,
    [ServiceLevel]   INT              NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              NULL,
    CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED ([ServiceId] ASC),
    CONSTRAINT [FK_Service_WebSite] FOREIGN KEY ([WebSiteId]) REFERENCES [Website].[WebSite] ([WebSiteId]) ON DELETE CASCADE
);





