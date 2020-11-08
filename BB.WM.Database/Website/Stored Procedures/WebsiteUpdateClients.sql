
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 25 Sept 2019
-- Description:	Website Update Clients
-- =============================================
CREATE PROCEDURE [Website].[WebsiteUpdateClients] 
	@WebSiteId			 UNIQUEIDENTIFIER,
	@WebsiteClients		 NVARCHAR(max),
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[WebSite]
	 SET 
       [WebsiteClients]		 = @WebsiteClients,
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy

 WHERE 
	 [WebSiteId] = @WebSiteId
END