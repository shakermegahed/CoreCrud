
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 25 Sept 2019
-- Description:	Website Update Team
-- =============================================
CREATE PROCEDURE [Website].[WebsiteUpdateTeam] 
	@WebSiteId			 UNIQUEIDENTIFIER,
	@WebSiteTeam				 NVARCHAR(max),
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[WebSite]
	 SET 
       [WebSiteTeam]		 = @WebSiteTeam,
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy

 WHERE 
	 [WebSiteId] = @WebSiteId
END