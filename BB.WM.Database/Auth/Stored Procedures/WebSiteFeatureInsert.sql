
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 13 Oct 2019
-- Description:	WebSite Feature Insert
-- =============================================
CREATE PROCEDURE [Auth].[WebSiteFeatureInsert] 
@WebSiteFeatureId		UNIQUEIDENTIFIER,
@WebSiteId				UNIQUEIDENTIFIER,
@FeatureId				UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [Auth].[WebSiteFeature]
           (
		   [WebSiteFeatureId],
           [WebSiteId],
           [FeatureId]
		   )
     VALUES
           (
		   @WebSiteFeatureId,
           @WebSiteId,
           @FeatureId
		   )
END