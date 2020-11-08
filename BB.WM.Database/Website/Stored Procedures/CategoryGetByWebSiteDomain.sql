
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Category Get By WebSite Domain
-- =============================================
create PROCEDURE [Website].[CategoryGetByWebSiteDomain] 
	@WebSiteDomain	NVARCHAR(150),
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Category] category
	INNER JOIN [Website].[WebSite] wesite ON category.WebSiteId = wesite.WebSiteId
	WHERE 
		wesite.WebSiteDomain= @WebSiteDomain
	AND category.IsDeleted	= @IsDeleted
END