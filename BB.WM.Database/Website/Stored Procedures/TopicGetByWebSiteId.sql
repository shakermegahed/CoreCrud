
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Topic Get By WebSiteId
-- =============================================
CREATE PROCEDURE [Website].[TopicGetByWebSiteId] 
	@WebSiteId		UNIQUEIDENTIFIER,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Topic]
	WHERE 
		WebSiteId	= @WebSiteId 
	AND IsDeleted	= @IsDeleted
END