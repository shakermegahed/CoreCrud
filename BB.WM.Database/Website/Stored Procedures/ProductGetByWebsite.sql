-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Website Product Get By Website
-- =============================================
create PROCEDURE [Website].[ProductGetByWebsite]
	@WebSiteId			UNIQUEIDENTIFIER,
	@WebsiteDomain		NVARCHAR(150),
	@IsDeleted			BIT,
	@PageSize			INT = 1000,
	@PageNumber			INT = 1

AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		SET NOCOUNT ON;
		WITH Result AS 
		(
		SELECT	product.*,
				Category.Title,
				website.WebSiteDomain
				
		FROM [Website].[Product] product
				INNER JOIN [Website].[Category] category ON product.CategoryId= category.CategoryId
				INNER JOIN [Website].[WebSite] website ON website.WebSiteId = category.WebSiteId
			
		WHERE
			(website.WebSiteDomain = @WebSiteDomain OR @WebSiteDomain IS NULL)
		AND (website.WebSiteId = @WebSiteId OR @WebSiteId IS NULL)
			), TotalCount AS ( -- TOTAL ROWS 
		SELECT COUNT(*) AS TotalCount FROM Result
		)
	
		SELECT * 
		FROM Result, TotalCount
		ORDER BY RESULT.ProductTitle Desc
		OFFSET ((@PageNumber - 1) * @PageSize) 
		ROWS FETCH NEXT @PageSize ROWS ONLY

END