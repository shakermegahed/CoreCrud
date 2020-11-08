
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	City Get By Id
-- =============================================
CREATE PROCEDURE [dbo].[DestinationGetById]
	@DestinationId		UNIQUEIDENTIFIER
AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		SET NOCOUNT ON;

		SELECT destination.*,country.Name AS CountryName 
		FROM [dbo].[Destination] destination
		INNER JOIN [dbo].[Country] country ON destination.CountryId = country.CountryId
		
		WHERE 
			destination.DestinationId = @DestinationId
END