
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Hotel Update
-- =============================================
CREATE PROCEDURE [dbo].[HotelUpdate] 
	@HotelId			UNIQUEIDENTIFIER,
	@Name			NVARCHAR(100),
	@DestinationId		UNIQUEIDENTIFIER,
	@IsApproved			BIT,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	UPDATE [dbo].[Hotel]
	   SET 
		  [Name]				= @Name,
		  [DestinationId]		= @DestinationId,
		  [IsApproved]			= @IsApproved,
		  [LastModifiedOn]		= @LastModifiedOn,
		  [LastModifiedBy]		= @LastModifiedBy
	WHERE 
		[HotelId]				= @HotelId
END