
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Category Get By Parent Id
-- =============================================
CREATE PROCEDURE [Website].[CategoryGetByParentId] 
	@parentId		UNIQUEIDENTIFIER,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Category]
	WHERE 
		parentId	= @parentId 
	AND IsDeleted	= @IsDeleted
END