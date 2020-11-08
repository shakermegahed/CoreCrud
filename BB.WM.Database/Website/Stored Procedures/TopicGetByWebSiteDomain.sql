
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Topic Get By WebSite Domain
-- =============================================
CREATE PROCEDURE [Website].[TopicGetByWebSiteDomain] 
	@WebSiteDomain	NVARCHAR(150),
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Topic] topic
	INNER JOIN [Website].[WebSite] wesite ON topic.WebSiteId = wesite.WebSiteId
	WHERE 
		wesite.WebSiteDomain= @WebSiteDomain
	AND topic.IsDeleted	= @IsDeleted
END