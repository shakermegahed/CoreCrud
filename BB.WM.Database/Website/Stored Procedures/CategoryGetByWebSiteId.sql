
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Category Get By WebSiteId
-- =============================================
CREATE PROCEDURE [Website].[CategoryGetByWebSiteId] 
	@WebSiteId		UNIQUEIDENTIFIER,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT Category.*,ParentCategory.Title as ParentName
	FROM [Website].[Category] Category
	LEFT OUTER JOIN [Website].[Category] ParentCategory on ParentCategory.CategoryId = Category.parentId
	WHERE 
		Category.WebSiteId	= @WebSiteId 
	AND Category.IsDeleted	= @IsDeleted



	SELECT * FROM [dbo].FileUpload fileUpload
	INNER JOIN [Website].[Category] category ON fileUpload.EntityId= category.CategoryId
	WHERE EntityId in (SELECT CategoryId from [Category] WHERE WebSiteId = @WebSiteId)
	ORDER BY EntityId
END