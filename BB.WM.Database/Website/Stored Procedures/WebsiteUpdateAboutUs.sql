
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 25 Sept 2019
-- Description:	Website Update AboutUs
-- =============================================
CREATE PROCEDURE [Website].[WebsiteUpdateAboutUs] 
	@WebSiteId			 UNIQUEIDENTIFIER,
	@AboutUs			 NVARCHAR(max),
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[WebSite]
	 SET 
       [AboutUs]			 = @AboutUs,
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy

 WHERE 
	 [WebSiteId] = @WebSiteId
END