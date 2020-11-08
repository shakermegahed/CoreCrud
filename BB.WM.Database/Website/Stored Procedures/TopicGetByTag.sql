
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Topic Get By Tag and WebsiteId
-- =============================================
CREATE PROCEDURE [Website].[TopicGetByTag] 
	@WebSiteId		UNIQUEIDENTIFIER,
	@Tag			NVARCHAR(200),
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
	AND TopicTag    = @Tag
END