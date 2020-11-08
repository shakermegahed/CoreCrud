
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Place Update
-- =============================================
CREATE PROCEDURE [dbo].[PlaceUpdate]
	@PlaceId			UNIQUEIDENTIFIER,
	@DestinationId		UNIQUEIDENTIFIER,
	@Name				NVARCHAR(50),
	@IsApproved			BIT,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [dbo].[Place]
	   SET 
		  [DestinationId]		= @DestinationId,
		  [Name]				= @Name,
		  [IsApproved]			= @IsApproved,
		  [LastModifiedOn]		= @LastModifiedOn,
		  [LastModifiedBy]		= @LastModifiedBy
	WHERE
		[PlaceId]				= @PlaceId
	
END