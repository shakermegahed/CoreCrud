
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 25 Sept 2019
-- Description:	Website Update
-- =============================================
CREATE PROCEDURE [Website].[WebsiteUpdate] 
	@WebSiteId			 UNIQUEIDENTIFIER,
	@WebSiteDomain		 NVARCHAR(150),
	@WebSiteLogo		 NVARCHAR(100),
	@Status				 INT,
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[WebSite]
	 SET 
       [WebSiteDomain]		 = @WebSiteDomain,
	   [WebSiteLogo]		 = @WebSiteLogo,
	   [Status]				 = @Status,
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy

 WHERE 
	 [WebSiteId] = @WebSiteId
END