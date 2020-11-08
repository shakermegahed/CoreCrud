
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Project Get By WebSite Domain
-- =============================================
CREATE PROCEDURE [Website].[ProjectGetByWebSiteDomain] 
	@WebSiteDomain	NVARCHAR(150),
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Project] event
	INNER JOIN [Website].[WebSite] website ON event.WebsiteId = website.WebSiteId
	WHERE 
		website.WebSiteDomain= @WebSiteDomain
	AND event.IsDeleted	= @IsDeleted
END