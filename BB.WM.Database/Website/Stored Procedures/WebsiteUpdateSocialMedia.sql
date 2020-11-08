
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 3 Oct 2019
-- Description:	Website Update SocialMedia
-- =============================================
CREATE PROCEDURE [Website].[WebsiteUpdateSocialMedia] 
	@WebSiteId					 UNIQUEIDENTIFIER,
	@WebSiteSocialMedia			 NVARCHAR(max),
	@LastModifiedOn				 DATETIME,
	@LastModifiedBy				 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[WebSite]
	 SET 
       [WebSiteSocialMedia]			= @WebSiteSocialMedia,
       [LastModifiedOn]				= @LastModifiedOn,
       [LastModifiedBy]				= @LastModifiedBy

 WHERE 
	 [WebSiteId] = @WebSiteId
END