
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Brand Get By WebSiteId
-- =============================================
CREATE PROCEDURE [Website].[BrandGetByWebSiteId] 
	@WebSiteId		UNIQUEIDENTIFIER,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Brand]
	WHERE 
		WebSiteId	= @WebSiteId 
	AND IsDeleted	= @IsDeleted
END