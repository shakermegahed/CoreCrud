
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	FileUpload Get By WebSiteId
-- =============================================
CREATE PROCEDURE [dbo].[FileUploadGetByWebsiteId] 
	@WebSiteId		UNIQUEIDENTIFIER,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT fileUpload.*,cat.Title as EntityName
	FROM [dbo].[FileUpload] fileUpload
	INNER JOIN [Website].[Category] cat ON fileUpload.EntityId = cat.CategoryId
	WHERE 
		cat.WebSiteId			= @WebSiteId 
	AND fileUpload.IsDeleted	= @IsDeleted
END