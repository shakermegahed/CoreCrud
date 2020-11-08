
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Oct 2019
-- Description:	WebSite Destination Update is delete
-- =============================================
CREATE PROCEDURE [Website].[WebSiteDestinationUpdateIsDelete] 
	@WebSiteDestinationId		UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	
	UPDATE [Website].[WebSiteDestination]
		SET 
			[LastModifiedOn]	= @LastModifiedOn,
			[LastModifiedBy]	= @LastModifiedBy,
			[IsDeleted]			= @IsDeleted
	WHERE 
		[WebSiteDestinationId]		= @WebSiteDestinationId
END