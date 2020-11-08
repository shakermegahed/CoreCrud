
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Service Get By WebSite Domain
-- =============================================
create PROCEDURE [Website].[ServiceGetByWebSiteDomain] 
	@WebSiteDomain	NVARCHAR(150),
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Service] Service
	INNER JOIN [Website].[WebSite] wesite ON Service.WebSiteId = wesite.WebSiteId
	WHERE 
		wesite.WebSiteDomain= @WebSiteDomain
	AND Service.IsDeleted	= @IsDeleted
END