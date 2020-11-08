
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 25 Sept 2019
-- Description:	Website Insert
-- =============================================
CREATE PROCEDURE [Website].[WebsiteInsert] 
	@WebSiteId			 UNIQUEIDENTIFIER,
	@WebSiteDomain		 NVARCHAR(150),
	@WebSiteLogo		 NVARCHAR(100),
	@WebSiteSocialMedia	 NVARCHAR(MAX),
	@AccountId			 UNIQUEIDENTIFIER,
	@CreatedOn			 DATETIME,
	@CreatedBy			 UNIQUEIDENTIFIER,
	@IsDeleted			 BIT,
	@Status				 INT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

   INSERT INTO [Website].[WebSite]
           (
			[WebSiteId],
            [WebSiteDomain],
			[WebSiteLogo],
            [AccountId],
			[WebSiteSocialMedia],
			[Status],
            [CreatedOn],
            [CreatedBy],
            [IsDeleted]
			)
     VALUES
           (
			@WebSiteId,
			@WebSiteDomain,
			@WebSiteLogo,
			@AccountId,
			@WebSiteSocialMedia,
			@Status,
			@CreatedOn,
			@CreatedBy,
			@IsDeleted
			)
END