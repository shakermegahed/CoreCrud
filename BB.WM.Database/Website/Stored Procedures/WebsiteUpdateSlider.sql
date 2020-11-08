
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 25 Sept 2019
-- Description:	Website Update Slider
-- =============================================
CREATE PROCEDURE [Website].[WebsiteUpdateSlider] 
	@WebSiteId			 UNIQUEIDENTIFIER,
	@WebSiteSlider		 NVARCHAR(max),
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[WebSite]
	 SET 
       [WebSiteSlider]		 = @WebSiteSlider,
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy

 WHERE 
	 [WebSiteId] = @WebSiteId
END