
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 3 Nov 2019
-- Description:	Place Get By City Id
-- =============================================
CREATE PROCEDURE [dbo].[PlaceGetByDestinationId]
	@DestinationId		UNIQUEIDENTIFIER,
	@IsDeleted			BIT,
	@IsApproved			BIT = NULL,
	@LoggedInAccountId	UNIQUEIDENTIFIER = NULL
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT 	place.*,destination.Name AS DestinationName, country.Name AS CountryName
	FROM [dbo].Place place
	INNER JOIN [dbo].Destination destination			ON place.DestinationId = destination.DestinationId
	INNER JOIN [dbo].[Country] country	ON destination.CountryId = country.CountryId
	WHERE 
		place.DestinationId = @DestinationId
	AND place.IsDeleted	= @IsDeleted

	AND ((place.IsApproved = @IsApproved ) OR (place.CreatedBy = @LoggedInAccountId OR @LoggedInAccountId IS NULL))
END