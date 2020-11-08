
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Event Get By WebSite Domain
-- =============================================
CREATE PROCEDURE [Website].[EventGetByWebSiteDomain] 
	@WebSiteDomain	NVARCHAR(150),
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Event] event
	INNER JOIN [Website].[WebSite] website ON event.WebsiteId = website.WebSiteId
	WHERE 
		website.WebSiteDomain= @WebSiteDomain
	AND event.IsDeleted	= @IsDeleted
END