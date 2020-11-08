
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 3 Nov 2019
-- Description:	Place Get By Id
-- =============================================
CREATE PROCEDURE [dbo].[PlaceGetById]
	@PlaceId			UNIQUEIDENTIFIER
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT 	place.*,destination.Name AS DestinationName, country.Name AS CountryName
	FROM [dbo].Place place
	INNER JOIN [dbo].DestinationId destination			ON place.DestinationId = destination.DestinationId
	INNER JOIN [dbo].[Country] country	ON destination.CountryId = country.CountryId
	WHERE 
		PlaceId = @PlaceId
END