
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Event Get By WebSiteId
-- =============================================
CREATE PROCEDURE [Website].[EventGetByWebSiteId] 
	@WebSiteId		UNIQUEIDENTIFIER,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Event]
	WHERE 
		WebsiteId	= @WebSiteId 
	AND IsDeleted	= @IsDeleted
END