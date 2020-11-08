
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Restaurant  GetId
-- =============================================
CREATE PROCEDURE [dbo].[RestaurantGetById]
	@RestaurantId				UNIQUEIDENTIFIER
AS
BEGIN

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		SET NOCOUNT ON;
		
		SELECT 	restaurant.*,destination .Name AS DestinationName, country.Name AS CountryName
		FROM [dbo].[Restaurant] restaurant 
		INNER JOIN [dbo].Destination destination  ON restaurant.DestinationId = destination.DestinationId
		INNER JOIN [dbo].[Country] country ON destination.CountryId = country.CountryId
		WHERE 
			restaurant.RestaurantId = @RestaurantId
END