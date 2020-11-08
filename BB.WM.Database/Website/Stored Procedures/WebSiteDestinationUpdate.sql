
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Oct 2019
-- Description:	WebSite Destination Update
-- =============================================
CREATE PROCEDURE [Website].[WebSiteDestinationUpdate] 
	@WebSiteDestinationId		UNIQUEIDENTIFIER,
	@DestinationId				UNIQUEIDENTIFIER,
	@ParentId					UNIQUEIDENTIFIER,
	@DestinationImages			NVARCHAR(MAX),
	@Description				NVARCHAR(MAX),
	@LastModifiedOn				DATETIME,
	@LastModifiedBy				UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	
	UPDATE [Website].[WebSiteDestination]
		SET 
			[DestinationId]			= @DestinationId,
			[DestinationImages]		= @DestinationImages,
			[Description]			= @Description,
			[ParentId]				= @ParentId,
			[LastModifiedOn]		= @LastModifiedOn,
			[LastModifiedBy]		= @LastModifiedBy
	WHERE 
		[WebSiteDestinationId]		= @WebSiteDestinationId
END