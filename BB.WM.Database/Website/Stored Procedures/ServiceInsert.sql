
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 23 Oct 2019
-- Description:	Website Service Insert
-- =============================================
CREATE PROCEDURE [Website].[ServiceInsert] 
	@ServiceId		UNIQUEIDENTIFIER,
	@WebSiteId		UNIQUEIDENTIFIER,
	@parentId		UNIQUEIDENTIFIER,
	@Title			NVARCHAR(150),
	@ImageFile		NVARCHAR(50),
	@ServiceOrder	INT,
	@ServiceLevel	INT,
	@Description	NVARCHAR(max),
	@CreatedBy		UNIQUEIDENTIFIER,
	@CreatedOn		DATETIME,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [Website].[Service]
           (
		   [ServiceId],
           [WebSiteId],
           [parentId],
           [Title],
           [ImageFile],
		   [ServiceOrder],
           [Description],
		   [ServiceLevel],
		   [CreatedBy],
		   [CreatedOn],
		   [IsDeleted]
		   )
     VALUES
           (
		   @ServiceId,
           @WebSiteId,
           @parentId,
           @Title,
           @ImageFile,
		   @ServiceOrder,
           @Description,
		   @ServiceLevel,
		   @CreatedBy,
		   @CreatedOn,
		   @IsDeleted
		   )
END