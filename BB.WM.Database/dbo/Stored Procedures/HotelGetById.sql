
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Hotel Get By Id
-- =============================================
CREATE PROCEDURE [dbo].[HotelGetById] 
	@HotelId			UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT hotel.*,destination.Name AS DestinationName, country.Name AS CountryName 
	FROM [dbo].[Hotel] hotel
	INNER JOIN [dbo].Destination destination ON hotel.DestinationId = destination.DestinationId
	INNER JOIN [dbo].[Country] country ON destination.CountryId = country.CountryId
	WHERE 
		HotelId = @HotelId
END