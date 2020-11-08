
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Sept 2019
-- Description:	Website Get All
-- =============================================
CREATE PROCEDURE [Website].[WebsiteGetAll] 
	@IsDeleted			BIT,
	@SearchKeyWord		NVARCHAR(150),
	@PageSize			INT = 1000,
	@PageNumber			INT = 1
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	WITH Result AS (
	SELECT website.*, account.FirstName +' '+account.LastName AS AccountName

	FROM [Website].[WebSite] website
	INNER JOIN [Account].[Account] account ON website.AccountId = account.AccountId
	WHERE website.IsDeleted = @IsDeleted
	AND (WebSiteDomain LIKE '%'+ @SearchKeyWord +'%' OR @SearchKeyWord= '' OR @SearchKeyWord IS NULL)
		), TotalCount AS ( -- TOTAL ROWS 
		SELECT COUNT(*) AS TotalCount FROM Result
	)
	
	SELECT * 
	FROM Result, TotalCount
	ORDER BY RESULT.CreatedOn Desc
	OFFSET ((@PageNumber - 1) * @PageSize) 
	ROWS FETCH NEXT @PageSize ROWS ONLY
	
   
END