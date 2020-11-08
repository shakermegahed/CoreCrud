
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Nov 2019
-- Description:	WebSite Place GetBy Website Id , Website Domain
-- =============================================
CREATE PROCEDURE [Travel].[EntertainmentGetByWebSite] 
	@WebSiteId					UNIQUEIDENTIFIER,
	@WebSiteDomain				NVARCHAR(150),
	@IsDeleted				BIT

AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;
	
	SELECT	entertainment.*,
			destination.Name as DestinationName
	FROM [Travel].[Entertainment] entertainment
			INNER JOIN [Website].[WebSiteDestination] wdestination ON wdestination.WebsiteDestinationId = entertainment.WebsiteDestinationId
			INNER JOIN [Website].[WebSite] website ON website.WebSiteId = wdestination.WebSiteId
			INNER JOIN [dbo].[Destination] destination ON destination.DestinationId = wdestination.DestinationId
	WHERE
		(website.WebSiteDomain = @WebSiteDomain OR @WebSiteDomain IS NULL)
	AND (website.WebSiteId = @WebSiteId OR @WebSiteId IS NULL)
	ORDER BY destination.Name
END