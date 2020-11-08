-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 30 Sept
-- Description:	GetByRoleName
-- =============================================
CREATE PROCEDURE [Account].[GetByRoleName]
	@RoleName			NVARCHAR(50),
	@SearchKeyWord		NVARCHAR(150),
	@PageSize			INT = 1000,
	@PageNumber			INT = 1
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	
	WITH Result AS (
	SELECT	account.*,
			[role].NormalizedRoleName As AccountRole
	FROM [Account].[Account] account
	INNER JOIN [Auth].[AccountRole] accountRole ON account.AccountId = accountRole.AccountId
	INNER JOIN [Auth].[Role] [role] ON accountRole.RoleId = [role].RoleId

	WHERE [role].RoleName = @RoleName
	AND ((FirstName LIKE '%'+ @SearchKeyWord +'%' OR @SearchKeyWord= '' OR @SearchKeyWord IS NULL )OR
		(LastName LIKE '%'+ @SearchKeyWord +'%' OR @SearchKeyWord= '' OR @SearchKeyWord IS NULL ))
	AND account.IsDeleted = 0
		), TotalCount AS ( -- TOTAL ROWS 
		SELECT COUNT(*) AS TotalCount FROM Result
	)
	
	SELECT * 
	FROM Result, TotalCount
	ORDER BY RESULT.CreatedOn Desc
	OFFSET ((@PageNumber - 1) * @PageSize) 
	ROWS FETCH NEXT @PageSize ROWS ONLY
END