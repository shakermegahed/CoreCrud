
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Nov 2019
-- Description:	WebSite Restaurant GetById
-- =============================================
Create PROCEDURE [Website].[WebSiteRestaurantGetById] 
	@WebSiteRestaurantId		UNIQUEIDENTIFIER

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
		wRestaurant.WebSiteRestaurantId = @WebSiteRestaurantId
END