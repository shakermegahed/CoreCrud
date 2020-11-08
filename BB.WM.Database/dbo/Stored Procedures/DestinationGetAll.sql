
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Nov 2019
-- Description:	City Get All
-- =============================================
CREATE PROCEDURE [dbo].[DestinationGetAll]

AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		SET NOCOUNT ON;

		SELECT destination.*,country.Name AS CountryName 
		FROM [dbo].[Destination] destination
		INNER JOIN [dbo].[Country] country ON destination.CountryId = country.CountryId
		
		ORDER BY country.Name

END