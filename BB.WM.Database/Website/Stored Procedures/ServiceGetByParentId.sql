
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 23 Oct 2019
-- Description:	Service Get All
-- =============================================
CREATE PROCEDURE [Website].[ServiceGetByParentId] 
	@parentId		UNIQUEIDENTIFIER,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Service]
	WHERE 
		parentId	= @parentId 
	AND IsDeleted	= @IsDeleted
END