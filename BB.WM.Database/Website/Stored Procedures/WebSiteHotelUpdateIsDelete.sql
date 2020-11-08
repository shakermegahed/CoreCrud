
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Oct 2019
-- Description:	WebSite Hotel Update is delete
-- =============================================
CREATE PROCEDURE [Website].[WebSiteHotelUpdateIsDelete] 
	@WebSiteHotelId		UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	
	UPDATE [Website].[WebSiteHotel]
		SET 
			[LastModifiedOn]	= @LastModifiedOn,
			[LastModifiedBy]	= @LastModifiedBy,
			[IsDeleted]			= @IsDeleted
	WHERE 
		[WebSiteHotelId]		= @WebSiteHotelId
END