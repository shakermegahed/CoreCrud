
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Nov 2019
-- Description:	WebSite Hotel GetById 
-- =============================================
create PROCEDURE [Website].[WebSiteHotelGetById] 
	@WebSiteHotelId				UNIQUEIDENTIFIER

AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;
	
	SELECT	wHotel.*,
			website.WebSiteDomain,
			hotel.Name AS HotelName,
			desitantion.Name		AS DestinationName,
			desitantion.DestinationId,
			country.Name		AS CountryName,
			country.CountryId
	FROM [Website].[WebSiteHotel] wHotel
			INNER JOIN [Website].[WebSite] website	ON wHotel.WebSiteId = website.WebSiteId
			INNER JOIN [dbo].[Hotel] hotel			ON wHotel.HotelId = hotel.HotelId
			INNER JOIN [dbo].[Destination] desitantion			ON hotel.DestinationId = desitantion.DestinationId
			INNER JOIN [dbo].[Country] country		ON desitantion.CountryId = country.CountryId
	WHERE
		wHotel.WebSiteHotelId = @WebSiteHotelId
END