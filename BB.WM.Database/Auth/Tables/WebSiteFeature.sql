CREATE TABLE [Auth].[WebSiteFeature] (
    [WebSiteFeatureId] UNIQUEIDENTIFIER NOT NULL,
    [WebSiteId]        UNIQUEIDENTIFIER NULL,
    [FeatureId]        UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_WebSiteFeature] PRIMARY KEY CLUSTERED ([WebSiteFeatureId] ASC),
    CONSTRAINT [FK_WebSiteFeature_Feature] FOREIGN KEY ([FeatureId]) REFERENCES [Auth].[Feature] ([FeatureId]) ON DELETE CASCADE,
    CONSTRAINT [FK_WebSiteFeature_WebSite] FOREIGN KEY ([WebSiteId]) REFERENCES [Website].[WebSite] ([WebSiteId]) ON DELETE CASCADE
);





