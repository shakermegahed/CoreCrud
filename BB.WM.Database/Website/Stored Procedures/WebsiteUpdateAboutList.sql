
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 4 Dec 2019
-- Description:	Website Update AboutList
-- =============================================
create PROCEDURE [Website].[WebsiteUpdateAboutList] 
	@WebSiteId			 UNIQUEIDENTIFIER,
	@AboutList			 NVARCHAR(max),
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[WebSite]
	 SET 
       [AboutList]			 = @AboutList,
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy

 WHERE 
	 [WebSiteId] = @WebSiteId
END