
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Restaurant  GetAll
-- =============================================
CREATE PROCEDURE [dbo].[RestaurantGetAll]
AS
BEGIN

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		SET NOCOUNT ON;
		
		SELECT 	restaurant.*,destination.Name AS DestinationName, country.Name AS CountryName, country.CountryId
		FROM [dbo].[Restaurant] restaurant 
		INNER JOIN [dbo].Destination destination ON restaurant.DestinationId = destination.DestinationId
		INNER JOIN [dbo].[Country] country ON destination.CountryId = country.CountryId
		ORDER BY destination.Name
END