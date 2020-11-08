
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Place Update
-- =============================================
CREATE PROCEDURE [dbo].[PlaceUpdateIsDelete]
	@PlaceId			UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [dbo].[Place]
	   SET 
		  [LastModifiedOn]		= @LastModifiedOn,
		  [LastModifiedBy]		= @LastModifiedBy,
		  [IsDeleted]			= @IsDeleted
	WHERE
		[PlaceId]				= @PlaceId
	
END