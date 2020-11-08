
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Service Get By WebSiteId
-- =============================================
CREATE PROCEDURE [Website].[ServiceGetByWebSiteId] 
	@WebSiteId		UNIQUEIDENTIFIER,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT service.*, parentService.Title as ParentName 
	FROM [Website].[Service] service
	LEFT OUTER JOIN [Website].[Service] parentService on parentService.ServiceId = service.parentId
	WHERE 
		service.WebSiteId	= @WebSiteId 
	AND service.IsDeleted	= @IsDeleted
END