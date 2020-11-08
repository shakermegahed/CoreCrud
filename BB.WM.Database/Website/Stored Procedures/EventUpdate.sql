
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 26 Oct 2019
-- Description:	WebSite Event Update
-- =============================================
CREATE PROCEDURE [Website].[EventUpdate] 
	@EventId			 UNIQUEIDENTIFIER,
	@EventTitle			 NVARCHAR(255),
	@EventDate			 DATETIME,
	@Images				 NVARCHAR(MAX),
	@CoverImage			 NVARCHAR(50),
	@Description		 NVARCHAR(MAX),
	@IsMain				 BIT,
	@EventTag			 NVARCHAR(150),
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
 
	UPDATE [Website].[Event]
		SET	  
			   [EventTitle]		= @EventTitle
			  ,[EventDate]		= @EventDate
			  ,[Images]			= @Images
			  ,[CoverImage]		= @CoverImage
			  ,[Description]	= @Description
			  ,[IsMain]			= @IsMain
			  ,[EventTag]		= @EventTag
			  ,[LastModifiedOn] = @LastModifiedOn
			  ,[LastModifiedBy] = @LastModifiedBy

	WHERE 
		[EventId]		= @EventId
END