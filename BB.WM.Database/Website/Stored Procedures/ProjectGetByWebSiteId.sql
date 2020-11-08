
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Project Get By WebSiteId
-- =============================================
CREATE PROCEDURE [Website].[ProjectGetByWebSiteId] 
	@WebSiteId		UNIQUEIDENTIFIER,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Project]
	WHERE 
		WebsiteId	= @WebSiteId 
	AND IsDeleted	= @IsDeleted
END