CREATE TABLE [Website].[WebSite] (
    [WebSiteId]          UNIQUEIDENTIFIER NOT NULL,
    [WebSiteDomain]      NVARCHAR (150)   NOT NULL,
    [AccountId]          UNIQUEIDENTIFIER NOT NULL,
    [WebSiteLogo]        NVARCHAR (100)   NULL,
    [WebSiteSlider]      NVARCHAR (MAX)   NULL,
    [WebsiteClients]     NVARCHAR (MAX)   NULL,
    [WebSiteSocialMedia] NVARCHAR (MAX)   NULL,
    [WebSiteTeam]        NVARCHAR (MAX)   NULL,
    [WebSiteCareers]     NVARCHAR (MAX)   NULL,
    [ContactUs]          NVARCHAR (MAX)   NULL,
    [AboutUs]            NVARCHAR (MAX)   NULL,
    [AboutList]          NVARCHAR (MAX)   NULL,
    [CreatedOn]          DATETIME         NOT NULL,
    [CreatedBy]          UNIQUEIDENTIFIER NULL,
    [LastModifiedOn]     DATETIME         NULL,
    [LastModifiedBy]     UNIQUEIDENTIFIER NULL,
    [IsDeleted]          BIT              NULL,
    [Status]             INT              NOT NULL,
    CONSTRAINT [PK_WebSite] PRIMARY KEY CLUSTERED ([WebSiteId] ASC),
    CONSTRAINT [FK_WebSite_Account] FOREIGN KEY ([AccountId]) REFERENCES [Account].[Account] ([AccountId]) ON DELETE CASCADE
);





