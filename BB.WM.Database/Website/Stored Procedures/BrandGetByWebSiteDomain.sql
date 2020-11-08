
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Brand Get By WebSite Domain
-- =============================================
CREATE PROCEDURE [Website].[BrandGetByWebSiteDomain] 
	@WebSiteDomain	NVARCHAR(150),
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Brand] brand
	INNER JOIN [Website].[WebSite] website ON brand.WebSiteId = website.WebSiteId
	WHERE 
		website.WebSiteDomain= @WebSiteDomain
	AND brand.IsDeleted	= @IsDeleted
END