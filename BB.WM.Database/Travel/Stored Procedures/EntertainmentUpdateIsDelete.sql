
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 24 Oct 2019
-- Description:	WebSite Entertainment Update IsDelete
-- =============================================
CREATE PROCEDURE [Travel].[EntertainmentUpdateIsDelete] 
	@EntertainmentId	UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Travel].[Entertainment]
   SET 
      [LastModifiedOn]	= @LastModifiedOn,
      [LastModifiedBy]	= @LastModifiedBy,
      [IsDeleted]		= @IsDeleted
	WHERE 
		[EntertainmentId] = @EntertainmentId
END