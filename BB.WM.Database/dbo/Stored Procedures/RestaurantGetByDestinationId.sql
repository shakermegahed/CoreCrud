
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Restaurant  Get By City Id
-- =============================================
CREATE PROCEDURE [dbo].[RestaurantGetByDestinationId]
	@DestinationId				UNIQUEIDENTIFIER,
	@IsDeleted			BIT,
	@IsApproved			BIT = NULL,
	@LoggedInAccountId	UNIQUEIDENTIFIER = NULL
AS
BEGIN

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		SET NOCOUNT ON;
		
		SELECT 	restaurant.*,destination.Name AS DestinationName, country.Name AS CountryName
		FROM [dbo].[Restaurant] restaurant 
		INNER JOIN [dbo].Destination destination ON restaurant.DestinationId = destination.DestinationId
		INNER JOIN [dbo].[Country] country ON destination.CountryId = country.CountryId
		WHERE 
			restaurant.DestinationId = @DestinationId
		AND restaurant.IsDeleted	= @IsDeleted

		AND ((restaurant.IsApproved = @IsApproved ) OR (restaurant.CreatedBy = @LoggedInAccountId OR @LoggedInAccountId IS NULL))
END