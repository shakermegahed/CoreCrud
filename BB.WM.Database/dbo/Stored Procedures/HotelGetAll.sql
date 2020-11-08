
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Hotel Get All
-- =============================================
CREATE PROCEDURE [dbo].[HotelGetAll] 

AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT hotel.*,destination.Name AS DestinationName, country.Name AS CountryName ,country.CountryId
	FROM [dbo].[Hotel] hotel
	INNER JOIN [dbo].[Destination] destination ON hotel.DestinationId = destination.DestinationId
	INNER JOIN [dbo].[Country] country ON destination.CountryId = country.CountryId
	ORDER BY destination.Name
	
END