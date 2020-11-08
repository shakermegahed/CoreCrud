
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 23 Oct 2019
-- Description:	Topic Update
-- =============================================
CREATE PROCEDURE [Website].[TopicUpdate] 
	@TopicId		UNIQUEIDENTIFIER,
	@WebSiteId		UNIQUEIDENTIFIER,
	@TopicTitle		NVARCHAR(200),
	@TopicTag		NVARCHAR(200),
	@TopicContent	NVARCHAR(MAX),
	@ImageFile		NVARCHAR(50),
	@TopicDate		DATETIME,
	@LastModifiedOn DATETIME,
	@LastModifiedBy UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[Topic]
	SET 		
	   [WebSiteId]			= @WebSiteId,     
	   [TopicTitle]			= @TopicTitle,	
	   [TopicTag]			= @TopicTag,		
	   [TopicContent]		= @TopicContent,
	   [ImageFile]			= @ImageFile,
	   [TopicDate]			= @TopicDate,	
	   [LastModifiedOn]		= @LastModifiedOn,
	   [LastModifiedBy]		= @LastModifiedBy
	WHERE 
		[TopicId]			= @TopicId
END