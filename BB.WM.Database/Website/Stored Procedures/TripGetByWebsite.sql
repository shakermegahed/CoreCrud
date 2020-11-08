
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 1 Dec 2019
-- Description:	Trip get by website
-- =============================================
CREATE PROCEDURE [Website].[TripGetByWebsite]
	@WebSiteId			UNIQUEIDENTIFIER,
	@WebsiteDomain		NVARCHAR(150),
	@IsDeleted			BIT,
	@keyword			NVARCHAR(MAX),
	@PageSize			INT = 1000,
	@PageNumber			INT = 1
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	WITH Result AS 
		(

			SELECT trip.* 
			FROM [Website].[Trip] trip
			INNER JOIN [Website].[WebSite] website ON trip.WebSiteId = website.WebSiteId
			WHERE 
				(trip.IsDeleted = @IsDeleted OR @IsDeleted IS NULL)
			AND (website.WebSiteId = @WebSiteId OR @WebSiteId IS NULL)
			AND (website.WebSiteDomain = @WebsiteDomain OR @WebsiteDomain IS NULL)
			AND ((@Keyword IS NOT NULL AND 
				(trip.TripTitle LIKE '%'+@Keyword+'%' OR trip.TripDestinations LIKE '%'+@Keyword+'%' OR trip.TripPlaces LIKE '%'+@Keyword+'%')) OR @Keyword IS NULL)
		), TotalCount AS ( -- TOTAL ROWS 
		SELECT COUNT(*) AS TotalCount FROM Result
		)
	
		SELECT * 
		FROM Result, TotalCount
		ORDER BY RESULT.CreatedOn Desc
		OFFSET ((@PageNumber - 1) * @PageSize) 
		ROWS FETCH NEXT @PageSize ROWS ONLY
	
END