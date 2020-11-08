
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Sept 2019
-- Description:	Website Get By Domain
-- =============================================
CREATE PROCEDURE [Website].[WebsiteGetByDomain] 
	@WebSiteDomain		NVARCHAR(150)
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT  website.*, account.FirstName +' '+account.LastName AS AccountName

	FROM [Website].[WebSite] website
	INNER JOIN [Account].[Account] account ON website.AccountId = account.AccountId 
	WHERE
		 WebSiteDomain = @WebSiteDomain
   
END