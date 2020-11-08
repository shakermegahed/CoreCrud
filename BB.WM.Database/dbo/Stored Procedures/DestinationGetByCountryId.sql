
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	City Get By CountryId
-- =============================================
CREATE PROCEDURE [dbo].[DestinationGetByCountryId]
	@CountryId		UNIQUEIDENTIFIER,
	@IsDeleted		BIT 
AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		SET NOCOUNT ON;

		SELECT destination.*,country.Name AS CountryName
		FROM [dbo].[Destination] destination
		INNER JOIN [dbo].[Country] country ON destination.CountryId = country.CountryId

		WHERE 
			destination.CountryId = @CountryId
		AND destination.IsDeleted = @IsDeleted
END