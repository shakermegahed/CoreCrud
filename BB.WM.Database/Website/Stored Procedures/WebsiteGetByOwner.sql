
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 25 Sept 2019
-- Description:	Website Get By Owner
-- =============================================
Create PROCEDURE [Website].[WebsiteGetByOwner] 
	@AccountId			 UNIQUEIDENTIFIER = NULL,
	@IsDeleted			 BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT website.*

	FROM [Website].[WebSite] website
	INNER JOIN [Account].[Account] account ON website.AccountId = account.AccountId 
	
	WHERE 
		(website.AccountId = @AccountId OR @AccountId IS NULL)
	AND (website.IsDeleted = @IsDeleted)
   
END