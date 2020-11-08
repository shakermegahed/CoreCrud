
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Website Category Insert
-- =============================================
CREATE PROCEDURE [Website].[CategoryInsert] 
	@CategoryId		UNIQUEIDENTIFIER,
	@WebSiteId		UNIQUEIDENTIFIER,
	@parentId		UNIQUEIDENTIFIER,
	@Title			NVARCHAR(150),
	@ImageFile		NVARCHAR(50),
	@CategoryLevel	INT,
	@CategoryOrder	INT,
	@Description	NVARCHAR(MAX),
	@CreatedBy		UNIQUEIDENTIFIER,
	@CreatedOn		DATETIME,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [Website].[Category]
           (
			   [CategoryId],
			   [WebSiteId],
			   [parentId],
			   [Title],
			   [ImageFile],
			   [Description],
			   [CategoryLevel],
			   [CategoryOrder],
			   [CreatedOn],
			   [CreatedBy],
			   [IsDeleted]
		   )
     VALUES
           (
			   @CategoryId,
			   @WebSiteId,
			   @parentId,
			   @Title,
			   @ImageFile,
			   @Description,
			   @CategoryLevel,
			   @CategoryOrder,
			   @CreatedOn,
			   @CreatedBy,
			   @IsDeleted
		   )
END