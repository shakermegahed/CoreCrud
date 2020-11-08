
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Hotel Update IsDelete
-- =============================================
CREATE PROCEDURE [dbo].[HotelUpdateIsDelete] 
	@HotelId			UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	UPDATE [dbo].[Hotel]
	   SET 
		  [LastModifiedOn]		= @LastModifiedOn,
		  [LastModifiedBy]		= @LastModifiedBy,
		  [IsDeleted]			= @IsDeleted
	WHERE 
		[HotelId]				= @HotelId
END