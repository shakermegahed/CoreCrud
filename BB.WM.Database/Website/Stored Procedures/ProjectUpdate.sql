
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 26 Oct 2019
-- Description:	WebSite Event Update
-- =============================================
CREATE PROCEDURE [Website].[ProjectUpdate] 
	@ProjectId			 UNIQUEIDENTIFIER,
	@ProjectTitle		 NVARCHAR(255),
	@Images				 NVARCHAR(MAX),
	@CoverImage			 NVARCHAR(50),
	@ProjectLink		 NVARCHAR(150),
	@ProjectOrder		 INT,
	@Description		 NVARCHAR(MAX),
	@ProjectTag			 NVARCHAR(150),
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
 
	UPDATE [Website].[Project]
		SET	  
			   [ProjectTitle]	= @ProjectTitle
			  ,[Images]			= @Images
			  ,[CoverImage]		= @CoverImage
			  ,[Description]	= @Description
			  ,[ProjectTag]		= @ProjectTag
			  ,[ProjectLink]	= @ProjectLink
			  ,[ProjectOrder]	= @ProjectOrder
			  ,[LastModifiedOn] = @LastModifiedOn
			  ,[LastModifiedBy] = @LastModifiedBy

	WHERE 
		[ProjectId]		= @ProjectId
END