
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 23 Oct 2019
-- Description:	Website Service Insert
-- =============================================
CREATE PROCEDURE [Website].[TopicInsert] 
	@TopicId		UNIQUEIDENTIFIER,
	@WebSiteId		UNIQUEIDENTIFIER,
	@TopicTitle		NVARCHAR(200),
	@TopicTag		NVARCHAR(200),
	@ImageFile		NVARCHAR(50),
	@TopicContent	NVARCHAR(MAX),
	@TopicDate		DATETIME,
	@CreatedOn		DATETIME,
	@CreatedBy		UNIQUEIDENTIFIER,
	@IsDeleted		BIT
AS	  
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [Website].[Topic]
           (
				[TopicId],		
				[WebSiteId],     
				[TopicTitle],	
				[TopicTag],	
				[ImageFile],
				[TopicContent],	
				[TopicDate],		
				[CreatedOn],     
				[CreatedBy],
				[IsDeleted]
		   )
     VALUES
           (
			 @TopicId,		
			 @WebSiteId,		 
			 @TopicTitle,		
			 @TopicTag,
			 @ImageFile,
			 @TopicContent,	
			 @TopicDate,		
			 @CreatedOn,		
			 @CreatedBy,
			 @IsDeleted
		  )
END