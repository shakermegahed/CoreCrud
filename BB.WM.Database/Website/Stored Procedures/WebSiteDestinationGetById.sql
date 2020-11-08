-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 9 Dec 2019
-- Description:	Destination Details
-- =============================================
CREATE PROCEDURE [Website].[WebSiteDestinationGetById]
	@WebsiteDestinationId		UNIQUEIDENTIFIER
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;
	--[1] destination information
	SELECT	destination.*,
			destination.Name AS destinationName,
			wdestination.DestinationImages,
			country.Name AS CountryName,
			wdestination.WebsiteDestinationId,
			wdestination.WebSiteId
	FROM	[dbo].[Destination] destination
			INNER JOIN [dbo].[Country] country						ON destination.CountryId = country.CountryId
			INNER JOIN [Website].[WebSiteDestination] wdestination	ON destination.DestinationId =wdestination.DestinationId
	WHERE
			wdestination.WebsiteDestinationId= @WebsiteDestinationId
	
	--[2] destination places
	SELECT	wPlace.*,
			place.Name AS PlaceName,
			destination.Name AS destinationName,
			country.Name AS CountryName
	FROM	[Website].[WebSitePlace] wPlace
			INNER JOIN [dbo].[Place] place							ON wPlace.PlaceId = place.PlaceId
			INNER JOIN [dbo].Destination destination				ON place.DestinationId = destination.DestinationId
			INNER JOIN [Website].[WebSiteDestination] wdestination	ON destination.DestinationId =wdestination.DestinationId
			INNER JOIN [dbo].Country country						ON destination.CountryId = country.CountryId
	WHERE
			wdestination.WebsiteDestinationId= @WebsiteDestinationId
			AND wPlace.IsDeleted = 0
			AND place.IsDeleted = 0
			AND place.IsApproved = 1
	
	--[3] destination restaurants
	SELECT	wRrestaurant.*,
			restaurant.Name AS restaurantName,
			destination.Name AS destinationName,
			country.Name AS CountryName
	FROM	[Website].[WebSiteRestaurant] wRrestaurant
			INNER JOIN [dbo].[Restaurant] restaurant				ON wRrestaurant.RestaurantId= restaurant.RestaurantId
			INNER JOIN [dbo].Destination destination				ON restaurant.DestinationId = destination.DestinationId
			INNER JOIN [Website].[WebSiteDestination] wdestination	ON destination.DestinationId =wdestination.DestinationId
			INNER JOIN [dbo].Country country						ON destination.CountryId = country.CountryId
	WHERE
			wdestination.WebsiteDestinationId= @WebsiteDestinationId
			AND wRrestaurant.IsDeleted = 0
			AND restaurant.IsDeleted = 0
			AND restaurant.IsApproved = 1
	
	--[4] destination hotels
	SELECT	wHotel.*,
			hotel.Name AS hotelName,
			destination.Name AS destinationName,
			country.Name AS CountryName
	FROM	[Website].[WebSiteHotel] wHotel
			INNER JOIN [dbo].[Hotel] hotel							ON wHotel.HotelId= hotel.HotelId
			INNER JOIN [dbo].Destination destination				ON hotel.DestinationId = destination.DestinationId
			INNER JOIN [Website].[WebSiteDestination] wdestination	ON destination.DestinationId =wdestination.DestinationId
			INNER JOIN [dbo].Country country						ON destination.CountryId = country.CountryId
	WHERE
			wdestination.WebsiteDestinationId= @WebsiteDestinationId
			AND wHotel.IsDeleted = 0
			AND hotel.IsDeleted = 0
			AND hotel.IsApproved = 1

	--[5] destination entertainments
	SELECT	entertainment.*,
			destination.Name AS destinationName,
			country.Name AS CountryName
	FROM	[Travel].[Entertainment] entertainment
			INNER JOIN [Website].[WebSiteDestination] wdestination	ON entertainment.WebSiteDestinationId = wdestination.WebsiteDestinationId
			INNER JOIN [dbo].Destination destination				ON wdestination.DestinationId= destination.DestinationId
			INNER JOIN [dbo].Country country						ON destination.CountryId = country.CountryId
	WHERE
			entertainment.WebsiteDestinationId= @WebsiteDestinationId
			AND entertainment.IsDeleted = 0

	--[6] destination destinations
	SELECT	destination.*,
			destination.Name AS destinationName,
			wdestination.DestinationImages,
			country.Name AS CountryName,
			wdestination.WebsiteDestinationId,
			wdestination.WebSiteId,
			wdestination.ParentId
	FROM	[dbo].[Destination] destination
			INNER JOIN [dbo].[Country] country						ON destination.CountryId = country.CountryId
			INNER JOIN [Website].[WebSiteDestination] wdestination	ON destination.DestinationId =wdestination.DestinationId
	WHERE
			wdestination.ParentId= @WebsiteDestinationId

	--[7] destination destinations	hotels	
	SELECT	wHotel.*,
			hotel.Name AS hotelName,
			hotel.DestinationId,
			destination.Name AS destinationName,
			country.Name AS CountryName
	FROM	[Website].[WebSiteHotel] wHotel
			INNER JOIN [dbo].[Hotel] hotel							ON wHotel.HotelId= hotel.HotelId
			INNER JOIN [dbo].Destination destination				ON hotel.DestinationId = destination.DestinationId
			INNER JOIN [Website].[WebSiteDestination] wdestination	ON destination.DestinationId =wdestination.DestinationId
			INNER JOIN [dbo].Country country						ON destination.CountryId = country.CountryId
	WHERE
			wdestination.ParentId= @WebsiteDestinationId
			AND wHotel.IsDeleted = 0
			AND hotel.IsDeleted = 0
			AND hotel.IsApproved = 1

	--[8] destination destinations	places	
	SELECT	wPlace.*,
			place.Name AS PlaceName,
			place.DestinationId,
			destination.Name AS destinationName,
			country.Name AS CountryName
	FROM	[Website].[WebSitePlace] wPlace
			INNER JOIN [dbo].[Place] place							ON wPlace.PlaceId = place.PlaceId
			INNER JOIN [dbo].Destination destination				ON place.DestinationId = destination.DestinationId
			INNER JOIN [Website].[WebSiteDestination] wdestination	ON destination.DestinationId =wdestination.DestinationId
			INNER JOIN [dbo].Country country						ON destination.CountryId = country.CountryId
	WHERE
			wdestination.ParentId= @WebsiteDestinationId
			AND wPlace.IsDeleted = 0
			AND place.IsDeleted = 0
			AND place.IsApproved = 1

	--[9] destination destinations	restaurants	
	SELECT	wRrestaurant.*,
			restaurant.Name AS restaurantName,
			restaurant.DestinationId,
			destination.Name AS destinationName,
			country.Name AS CountryName
	FROM	[Website].[WebSiteRestaurant] wRrestaurant
			INNER JOIN [dbo].[Restaurant] restaurant				ON wRrestaurant.RestaurantId= restaurant.RestaurantId
			INNER JOIN [dbo].Destination destination				ON restaurant.DestinationId = destination.DestinationId
			INNER JOIN [Website].[WebSiteDestination] wdestination	ON destination.DestinationId =wdestination.DestinationId
			INNER JOIN [dbo].Country country						ON destination.CountryId = country.CountryId
	WHERE
			wdestination.ParentId= @WebsiteDestinationId
			AND wRrestaurant.IsDeleted = 0
			AND restaurant.IsDeleted = 0
			AND restaurant.IsApproved = 1

	--[10] destination destinations entertainments
	SELECT	entertainment.*,
			destination.Name AS destinationName,
			country.Name AS CountryName
	FROM	[Travel].[Entertainment] entertainment
			INNER JOIN [Website].[WebSiteDestination] wdestination	ON entertainment.WebSiteDestinationId = wdestination.WebsiteDestinationId
			INNER JOIN [dbo].Destination destination				ON wdestination.DestinationId= destination.DestinationId
			INNER JOIN [dbo].Country country						ON destination.CountryId = country.CountryId
	WHERE
			wdestination.ParentId= @WebsiteDestinationId
			AND entertainment.IsDeleted = 0
END