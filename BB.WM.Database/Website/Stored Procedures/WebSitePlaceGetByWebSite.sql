
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Nov 2019
-- Description:	WebSite Place GetBy Website Id , Website Domain
-- =============================================
CREATE PROCEDURE [Website].[WebSitePlaceGetByWebSite] 
	@WebSiteId					UNIQUEIDENTIFIER,
	@WebSiteDomain				NVARCHAR(150),
	@WebSitePlaceIsDeleted		BIT,
	@PlaceIsDeleted				BIT

AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;
	
	SELECT	wPlace.*,
			website.WebSiteDomain,
			place.Name		AS PlaceName,
			desitantion.Name		AS DestinationName,
			desitantion.DestinationId,
			country.Name		AS CountryName,
			country.CountryId
	FROM [Website].[WebSitePlace] wPlace
			INNER JOIN [Website].[WebSite] website	ON wPlace.WebSiteId = website.WebSiteId
			INNER JOIN [dbo].[Place] place			ON wPlace.PlaceId = place.PlaceId
			INNER JOIN [dbo].[Destination] desitantion			ON place.DestinationId = desitantion.DestinationId
			INNER JOIN [dbo].[Country] country		ON desitantion.CountryId = country.CountryId
	WHERE
		(website.WebSiteDomain = @WebSiteDomain OR @WebSiteDomain IS NULL)
	AND (website.WebSiteId = @WebSiteId OR @WebSiteId IS NULL)
	AND (wPlace.IsDeleted = @WebSitePlaceIsDeleted OR @WebSitePlaceIsDeleted IS NULL)
	AND (place.IsDeleted = @PlaceIsDeleted OR @PlaceIsDeleted IS NULL)
	ORDER BY desitantion.Name
END