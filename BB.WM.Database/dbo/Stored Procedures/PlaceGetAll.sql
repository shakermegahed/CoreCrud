
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 3 Nov 2019
-- Description:	Place Get All
-- =============================================
CREATE PROCEDURE [dbo].[PlaceGetAll]
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT 	place.*,destination.Name AS DestinationName, country.Name AS CountryName, country.CountryId
	FROM [dbo].Place place
	INNER JOIN [dbo].Destination destination	ON place.DestinationId = destination.DestinationId
	INNER JOIN [dbo].[Country] country	ON destination.CountryId = country.CountryId
	ORDER BY destination.Name
	
END