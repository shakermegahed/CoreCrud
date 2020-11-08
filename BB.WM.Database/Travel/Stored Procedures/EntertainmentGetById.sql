
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Nov 2019
-- Description:	WebSite Place GetById 
-- =============================================
create PROCEDURE [Travel].[EntertainmentGetById] 
	@EntertainmentId			UNIQUEIDENTIFIER

AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;
	
	SELECT	entertainment.*,
			destination.Name as DestinationName
	FROM [Travel].[Entertainment] entertainment
			INNER JOIN [Website].[WebSiteDestination] wdestination ON wdestination.WebsiteDestinationId = entertainment.WebsiteDestinationId
			INNER JOIN [Website].[WebSite] website ON website.WebSiteId = wdestination.WebSiteId
			INNER JOIN [dbo].[Destination] destination ON destination.DestinationId = wdestination.DestinationId
	WHERE
		EntertainmentId = @EntertainmentId
END