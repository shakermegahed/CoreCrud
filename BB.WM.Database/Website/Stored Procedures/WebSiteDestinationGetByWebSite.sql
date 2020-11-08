
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Nov 2019
-- Description:	WebSite Destination GetBy Website Id , Website Domain
-- =============================================
CREATE PROCEDURE [Website].[WebSiteDestinationGetByWebSite] 
	@WebSiteId					UNIQUEIDENTIFIER,
	@WebSiteDomain				NVARCHAR(150),
	@WebSiteDestinationIsDeleted		BIT,
	@DestinationIsDeleted				BIT

AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;
	
	SELECT	wdestination.*,
			website.WebSiteDomain,
			desitantion.Name		AS DestinationName,
			country.Name		AS CountryName,
			country.CountryId
	FROM [Website].[WebSiteDestination] wdestination
			INNER JOIN [Website].[WebSite] website	ON wdestination.WebSiteId = website.WebSiteId
			INNER JOIN [dbo].[Destination] destination			ON wdestination.DestinationId = Destination.DestinationId
			INNER JOIN [dbo].[Destination] desitantion			ON Destination.DestinationId = desitantion.DestinationId
			INNER JOIN [dbo].[Country] country		ON desitantion.CountryId = country.CountryId
	WHERE
		(website.WebSiteDomain = @WebSiteDomain OR @WebSiteDomain IS NULL)
	AND (website.WebSiteId = @WebSiteId OR @WebSiteId IS NULL)
	AND (wdestination.IsDeleted = @WebSiteDestinationIsDeleted OR @WebSiteDestinationIsDeleted IS NULL)
	AND (Destination.IsDeleted = @DestinationIsDeleted OR @DestinationIsDeleted IS NULL)
	ORDER BY country.Name
END