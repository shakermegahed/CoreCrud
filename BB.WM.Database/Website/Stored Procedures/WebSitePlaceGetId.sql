
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 10 Dec 2019
-- Description:	WebSite Place GetById
-- =============================================
Create PROCEDURE [Website].[WebSitePlaceGetId] 
	@WebSitePlaceId		UNIQUEIDENTIFIER

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
		wPlace.WebSitePlaceId = @WebSitePlaceId
END