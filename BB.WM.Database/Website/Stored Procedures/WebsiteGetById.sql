
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Sept 2019
-- Description:	Website Get By Id
-- =============================================
CREATE PROCEDURE [Website].[WebsiteGetById] 
	@WebSiteId			 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT website.*, account.FirstName +' '+account.LastName AS AccountName
	FROM [Website].[WebSite] website
	INNER JOIN [Account].[Account] account ON website.AccountId = account.AccountId
	WHERE
		 WebSiteId = @WebSiteId

	SELECT websiteFeatures.*, feature.Name AS FeatureName,feature.Code AS FeatureCode
	FROM [Auth].[WebSiteFeature] websiteFeatures
	INNER JOIN [Auth].[Feature] feature ON feature.FeatureId = websiteFeatures.FeatureId
	WHERE
		 WebSiteId = @WebSiteId
	
   
END