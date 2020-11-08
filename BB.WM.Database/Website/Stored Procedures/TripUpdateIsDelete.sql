
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 1 Dec 2019
-- Description:	Trip update isdelete
-- =============================================
CREATE  PROCEDURE [Website].[TripUpdateIsDelete]
	@TripId				UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT

AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	UPDATE [Website].[Trip]
	   SET 
			[LastModifiedOn]	= @LastModifiedOn,
			[LastModifiedBy]	= @LastModifiedBy,
			[IsDeleted]			= @IsDeleted
	WHERE
		[TripId] = @TripId
	
END