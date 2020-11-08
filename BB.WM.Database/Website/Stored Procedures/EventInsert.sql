
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 14 Nov 2019
-- Description:	Website event Insert
-- =============================================
CREATE PROCEDURE [Website].[EventInsert] 
	@EventId			 UNIQUEIDENTIFIER,
	@EventTitle			 NVARCHAR(255),
	@EventTag			 NVARCHAR(150),
	@Images				 NVARCHAR(MAX),
	@CoverImage			 NVARCHAR(50),
	@EventDate			 DATETIME,
	@WebsiteId			 UNIQUEIDENTIFIER,
	@Description		 NVARCHAR(MAX),
	@IsMain				 BIT,
	@CreatedOn			 DATETIME,
	@CreatedBy			 UNIQUEIDENTIFIER,
	@IsDeleted			 BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

   INSERT INTO [Website].[Event]
           ([EventId]
           ,[EventTitle]
           ,[EventDate]
           ,[Images]
		   ,[CoverImage]
           ,[WebsiteId]
		   ,[EventTag]
		   ,[IsMain]
           ,[Description]
           ,[CreatedOn]
           ,[CreatedBy]
           ,[IsDeleted])
     VALUES
           (
			 @EventId	
			,@EventTitle	
			,@EventDate	
			,@Images
			,@CoverImage
			,@WebsiteId
			,@EventTag
			,@IsMain
			,@Description
			,@CreatedOn	
			,@CreatedBy	
			,@IsDeleted
			)
	 END