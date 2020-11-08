
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	WebSite Place Update
-- =============================================
CREATE PROCEDURE [Website].[WebSitePlaceUpdate] 
	@WebSitePlaceId		UNIQUEIDENTIFIER,
	@PlaceId			UNIQUEIDENTIFIER,
	@ParentId			UNIQUEIDENTIFIER,
	@PlaceImages		NVARCHAR(MAX),
	@Description		NVARCHAR(MAX),
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[WebSitePlace]
	 SET 
		[PlaceId]				= @PlaceId,
		[PlaceImages]			= @PlaceImages,
		[ParentId]				= @ParentId,
		[Description]			= @Description,
		[LastModifiedOn]		= @LastModifiedOn,
		[LastModifiedBy]		= @LastModifiedBy

	WHERE 
			[WebSitePlaceId]	= @WebSitePlaceId
END