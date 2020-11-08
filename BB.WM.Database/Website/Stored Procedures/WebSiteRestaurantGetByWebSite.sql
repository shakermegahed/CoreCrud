
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Nov 2019
-- Description:	WebSite Restaurant GetBy Website Id , Website Domain
-- =============================================
CREATE PROCEDURE [Website].[WebSiteRestaurantGetByWebSite] 
	@WebSiteId						UNIQUEIDENTIFIER,
	@WebSiteDomain					NVARCHAR(150),
	@WebSiteRestaurantIsDeleted		BIT,
	@RestaurantIsDeleted			BIT

AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;
	
	SELECT	wRestaurant.*,
			website.WebSiteDomain,
			restaurant.Name AS RestaurantName,
			destination.Name		AS DestinationName,
			destination.DestinationId,
			country.Name		AS CountryName,
			country.CountryId
	FROM [Website].[WebSiteRestaurant] wRestaurant
			INNER JOIN [Website].[WebSite] website		ON wRestaurant.WebSiteId = website.WebSiteId
			INNER JOIN [dbo].[Restaurant] restaurant	ON wRestaurant.RestaurantId = restaurant.RestaurantId
			INNER JOIN [dbo].[Destination] destination				ON restaurant.DestinationId = destination.DestinationId
			INNER JOIN [dbo].[Country] country			ON Destination.CountryId = country.CountryId
	WHERE
		(website.WebSiteDomain = @WebSiteDomain OR @WebSiteDomain IS NULL)
	AND (website.WebSiteId = @WebSiteId OR @WebSiteId IS NULL)
	AND (wRestaurant.IsDeleted = @WebSiteRestaurantIsDeleted OR @WebSiteRestaurantIsDeleted IS NULL)
	AND (restaurant.IsDeleted = @RestaurantIsDeleted OR @RestaurantIsDeleted IS NULL)
	ORDER BY destination.Name
END