
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 9 Oct 2019
-- Description:	Form Get By WebSite Id
-- =============================================
CREATE PROCEDURE [dbo].[FormGetByWebSiteId]
	@WebSiteId		UNIQUEIDENTIFIER,
	@PageSize		INT = 1000,
	@PageNumber		INT = 1,
	@Keyword		NVARCHAR(150)

AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	WITH Result AS (
	SELECT form.*
	FROM [dbo].[Form] form
	INNER JOIN [Website].[WebSite]  website ON form.WebSiteDomain = website.WebSiteDomain

	WHERE website.WebSiteId = @WebSiteId 
			AND
			((@Keyword IS NOT NULL AND (form.FormContent LIKE '%'+@Keyword+'%' OR form.FormType LIKE '%'+@Keyword+'%')) OR @Keyword IS NULL)
		), TotalCount AS ( -- TOTAL ROWS 
		SELECT COUNT(*) AS TotalCount FROM Result
	)
	
	SELECT * 
	FROM Result, TotalCount
	ORDER BY RESULT.CreationDate Desc
	OFFSET ((@PageNumber - 1) * @PageSize) 
	ROWS FETCH NEXT @PageSize ROWS ONLY

END