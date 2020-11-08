
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 24 Oct 2019
-- Description:	WebSite Place Insert
-- =============================================
CREATE PROCEDURE [Website].[WebSitePlaceInsert] 
	@WebSitePlaceId		UNIQUEIDENTIFIER,
	@WebSiteId			UNIQUEIDENTIFIER,
	@PlaceId			UNIQUEIDENTIFIER,
	@ParentId			UNIQUEIDENTIFIER,
	@PlaceImages		NVARCHAR(MAX),
	@Description		NVARCHAR(MAX),
	@CreatedOn			DATETIME,
	@CreatedBy			UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [Website].[WebSitePlace]
           (
		   [WebSitePlaceId],
           [WebSiteId],
           [PlaceId],
		   [ParentId],
		   [PlaceImages],
		   [Description],
           [CreatedOn],
           [CreatedBy],
           [IsDeleted]
		   )
     VALUES
           (
		   @WebSitePlaceId,
           @WebSiteId,
           @PlaceId,
		   @ParentId,
		   @PlaceImages,
		   @Description,
           @CreatedOn,
           @CreatedBy,
           @IsDeleted
		   )
END