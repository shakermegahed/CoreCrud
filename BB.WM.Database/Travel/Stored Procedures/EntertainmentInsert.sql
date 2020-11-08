
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 24 Oct 2019
-- Description:	WebSite Place Insert
-- =============================================
CREATE PROCEDURE [Travel].[EntertainmentInsert] 
	@EntertainmentId		UNIQUEIDENTIFIER,
	@WebSiteDestinationId	UNIQUEIDENTIFIER,
	@Name					NVARCHAR(100),
	@Location				NVARCHAR(100),
	@Images					NVARCHAR(MAX),
	@Description			NVARCHAR(MAX),
	@CreatedOn				DATETIME,
	@CreatedBy				UNIQUEIDENTIFIER,
	@IsDeleted				BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [Travel].[Entertainment]
           (
		   [EntertainmentId],
           [WebSiteDestinationId],
           [Name],
		   [Location],
		   [Images],
		   [Description],
           [CreatedOn],
           [CreatedBy],
           [IsDeleted]
		   )
     VALUES
           (
		   @EntertainmentId,
           @WebSiteDestinationId,
           @Name,
		   @Location,
		   @Images,
		   @Description,
           @CreatedOn,
           @CreatedBy,
           @IsDeleted
		   )
END