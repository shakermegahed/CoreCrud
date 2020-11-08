
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Oct 2019
-- Description:	WebSite Destination Insert
-- =============================================
CREATE PROCEDURE [Website].[WebSiteDestinationInsert] 
	@WebSiteDestinationId		UNIQUEIDENTIFIER,
	@WebSiteId					UNIQUEIDENTIFIER,
	@DestinationId				UNIQUEIDENTIFIER,
	@ParentId					UNIQUEIDENTIFIER,
	@DestinationImages			NVARCHAR(MAX),
	@Description				NVARCHAR(MAX),
	@CreatedOn					DATETIME,
	@CreatedBy					UNIQUEIDENTIFIER,
	@IsDeleted					BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [Website].[WebSiteDestination]
           (
			[WebSiteDestinationId],
			[WebSiteId],
			[DestinationId],
			[ParentId],
			[DestinationImages],
			[Description],
			[CreatedOn],
			[CreatedBy],
			[IsDeleted]
		   )
     VALUES
           (
		   @WebSiteDestinationId,
           @WebSiteId,
           @DestinationId, 
		   @ParentId,
           @DestinationImages,
		   @Description,
           @CreatedOn,
           @CreatedBy,
           @IsDeleted
		   )
END