
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 13 Oct 2019
-- Description:	WebSite Feature Delete
-- =============================================
CREATE PROCEDURE [Auth].[WebSiteFeatureDelete] 
@WebSiteFeatureId		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	DELETE FROM [Auth].[WebSiteFeature]
	WHERE
		WebSiteFeatureId = @WebSiteFeatureId
END