
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Oct 2019
-- Description:	WebSite Restaurant Update is delete
-- =============================================
CREATE PROCEDURE [Website].[WebSiteRestaurantUpdateIsDelete] 
	@WebSiteRestaurantId		UNIQUEIDENTIFIER,
	@LastModifiedOn				DATETIME,
	@LastModifiedBy				UNIQUEIDENTIFIER,
	@IsDeleted					BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	
	UPDATE [Website].[WebSiteRestaurant]
		SET 
			[LastModifiedOn]	= @LastModifiedOn,
			[LastModifiedBy]	= @LastModifiedBy,
			[IsDeleted]			= @IsDeleted
	WHERE 
		[WebSiteRestaurantId]	= @WebSiteRestaurantId
END