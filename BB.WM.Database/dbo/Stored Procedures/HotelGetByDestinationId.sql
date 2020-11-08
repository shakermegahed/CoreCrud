
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Hotel Get By City Id
-- =============================================
CREATE PROCEDURE [dbo].[HotelGetByDestinationId] 
	@DestinationId				UNIQUEIDENTIFIER,
	@IsDeleted			BIT,
	@IsApproved			BIT = NULL,
	@LoggedInAccountId	UNIQUEIDENTIFIER = NULL
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT hotel.*,destination.Name AS DestinationName, country.Name AS CountryName 
	FROM [dbo].[Hotel] hotel
	INNER JOIN [dbo].[Destination] destination ON hotel.DestinationId = destination.DestinationId
	INNER JOIN [dbo].[Country] country ON destination.CountryId = country.CountryId
	WHERE 
		hotel.DestinationId = @DestinationId
	AND hotel.IsDeleted	= @IsDeleted

	AND ((hotel.IsApproved = @IsApproved ) OR (hotel.CreatedBy = @LoggedInAccountId OR @LoggedInAccountId IS NULL))
END