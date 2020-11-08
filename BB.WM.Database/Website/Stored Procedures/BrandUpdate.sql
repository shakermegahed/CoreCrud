
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 26 Oct 2019
-- Description:	WebSite Brand Update
-- =============================================
CREATE PROCEDURE [Website].[BrandUpdate] 
	@BrandId			 UNIQUEIDENTIFIER,
	@BrandName			 NVARCHAR(50),
	@ImageFile			 NVARCHAR(50),
	@BrandOrder			 INT,
	@BrandLink			 NVARCHAR(MAX),
	@WebsiteId			 UNIQUEIDENTIFIER,
	@Description		 NVARCHAR(MAX),
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
 
	UPDATE [Website].[Brand]
		SET	  
			   [BrandName]		= @BrandName
			  ,[ImageFile]		= @ImageFile
			  ,[BrandOrder]		= @BrandOrder
			  ,[BrandLink]		= @BrandLink
			  ,[WebsiteId]		= @WebsiteId
			  ,[Description]	= @Description
			  ,[LastModifiedOn] = @LastModifiedOn
			  ,[LastModifiedBy] = @LastModifiedBy

	WHERE 
		[BrandId]		= @BrandId
END