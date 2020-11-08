
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 24 Oct 2019
-- Description:	WebSite Place Update IsDelete
-- =============================================
create PROCEDURE [Website].[WebSitePlaceUpdateIsDelete] 
@WebSitePlaceId		UNIQUEIDENTIFIER,
@LastModifiedOn		DATETIME,
@LastModifiedBy		UNIQUEIDENTIFIER,
@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[WebSitePlace]
   SET 
     
      [LastModifiedOn]	= @LastModifiedOn,
      [LastModifiedBy]	= @LastModifiedBy,
      [IsDeleted]		= @IsDeleted
	WHERE 
		[WebSitePlaceId] = @WebSitePlaceId
END