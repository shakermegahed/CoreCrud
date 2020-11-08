
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Category Update
-- =============================================
CREATE PROCEDURE [Website].[CategoryUpdate] 
	@CategoryId		UNIQUEIDENTIFIER,
	@parentId		UNIQUEIDENTIFIER,
	@Title			NVARCHAR(150),
	@ImageFile		NVARCHAR(50),
	@Description	NVARCHAR(max),
	@CategoryLevel	INT,
	@CategoryOrder	INT,
	@LastModifiedOn DATETIME,
	@LastModifiedBy UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[Category]
	   SET 
		 
		  [parentId]		= @parentId,
		  [Title]			= @Title,
		  [ImageFile]		= @ImageFile,
		  [Description]		= @Description,
		  [CategoryLevel]	= @CategoryLevel,
		  [CategoryOrder]	= @CategoryOrder,
		  [LastModifiedOn]	= @LastModifiedOn,
		  [LastModifiedBy]	= @LastModifiedBy
	 WHERE 
		[CategoryId]		= @CategoryId
END