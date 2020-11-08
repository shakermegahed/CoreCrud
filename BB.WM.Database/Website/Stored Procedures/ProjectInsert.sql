
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 14 Nov 2019
-- Description:	Website event Insert
-- =============================================
CREATE PROCEDURE [Website].[ProjectInsert] 
	@ProjectId			 UNIQUEIDENTIFIER,
	@ProjectTitle		 NVARCHAR(255),
	@ProjectTag			 NVARCHAR(150),
	@ProjectLink		 NVARCHAR(150),
	@ProjectOrder		 INT,
	@Images				 NVARCHAR(MAX),
	@CoverImage			 NVARCHAR(50),
	@WebsiteId			 UNIQUEIDENTIFIER,
	@Description		 NVARCHAR(MAX),
	@CreatedOn			 DATETIME,
	@CreatedBy			 UNIQUEIDENTIFIER,
	@IsDeleted			 BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

   INSERT INTO [Website].[Project]
           ([ProjectId]
           ,[ProjectTitle]
           ,[Images]
		   ,[CoverImage]
		   ,[ProjectLink]
		   ,[ProjectOrder]
           ,[WebsiteId]
		   ,[ProjectTag]
           ,[Description]
           ,[CreatedOn]
           ,[CreatedBy]
           ,[IsDeleted])
     VALUES
           (
			 @ProjectId	
			,@ProjectTitle
			,@Images
			,@CoverImage
			,@ProjectLink
			,@ProjectOrder
			,@WebsiteId
			,@ProjectTag
			,@Description
			,@CreatedOn	
			,@CreatedBy	
			,@IsDeleted
			)
	 END