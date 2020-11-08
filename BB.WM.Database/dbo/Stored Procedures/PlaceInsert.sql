
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Place Insert
-- =============================================
CREATE PROCEDURE [dbo].[PlaceInsert]
	@PlaceId			UNIQUEIDENTIFIER,
	@DestinationId		UNIQUEIDENTIFIER,
	@Name				NVARCHAR(50),
	@IsApproved			BIT,
	@CreatedOn			DATETIME,
	@CreatedBy			UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [dbo].[Place]
           (
			   [PlaceId],
			   [DestinationId],
			   [Name],
			   [IsApproved],
			   [CreatedOn],
			   [CreatedBy],
			   [IsDeleted]
		   )
     VALUES
           (
				@PlaceId,
				@DestinationId,
				@Name,
				@IsApproved,
				@CreatedOn,
				@CreatedBy,
				@IsDeleted
			)
END