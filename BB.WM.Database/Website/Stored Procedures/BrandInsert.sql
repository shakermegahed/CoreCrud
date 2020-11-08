
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 14 Nov 2019
-- Description:	Website brand Insert
-- =============================================
CREATE PROCEDURE [Website].[BrandInsert] 
	@BrandId			 UNIQUEIDENTIFIER,
	@BrandName			 NVARCHAR(50),
	@ImageFile			 NVARCHAR(50),
	@BrandOrder			 INT,
	@BrandLink			 NVARCHAR(MAX),
	@WebsiteId			 UNIQUEIDENTIFIER,
	@Description		 NVARCHAR(MAX),
	@CreatedOn			 DATETIME,
	@CreatedBy			 UNIQUEIDENTIFIER,
	@IsDeleted			 BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

   INSERT INTO [Website].[Brand]
           ([BrandId]
           ,[BrandName]
           ,[ImageFile]
           ,[BrandOrder]
           ,[BrandLink]
           ,[WebsiteId]
           ,[Description]
           ,[CreatedOn]
           ,[CreatedBy]
           ,[IsDeleted])
     VALUES
           (
			 @BrandId	
			,@BrandName	
			,@ImageFile	
			,@BrandOrder	
			,@BrandLink	
			,@WebsiteId
			,@Description
			,@CreatedOn	
			,@CreatedBy	
			,@IsDeleted
			)
	 END