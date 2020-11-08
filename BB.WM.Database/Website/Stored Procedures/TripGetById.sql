
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 1 Dec 2019
-- Description:	Trip get by Id
-- =============================================
CREATE PROCEDURE [Website].[TripGetById]
	@TripId			UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

			SELECT trip.* 
			FROM [Website].[Trip] trip
			INNER JOIN [Website].[WebSite] website ON trip.WebSiteId = website.WebSiteId
			WHERE 
				trip.TripId = @TripId

	
END