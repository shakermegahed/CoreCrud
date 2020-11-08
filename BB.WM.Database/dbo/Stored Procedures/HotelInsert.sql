
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Hotel Insert
-- =============================================
CREATE PROCEDURE [dbo].[HotelInsert] 
	@HotelId			UNIQUEIDENTIFIER,
	@Name				NVARCHAR(100),
	@DestinationId		UNIQUEIDENTIFIER,
	@IsApproved			BIT,
	@CreatedOn			DATETIME,
	@CreatedBy			UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [dbo].[Hotel]
           (
		   [HotelId],
           [Name],
           [DestinationId],
		   [IsApproved],
           [CreatedOn],
           [CreatedBy],
           [IsDeleted]
		   )
     VALUES
           (
			@HotelId,
			@Name,
			@DestinationId,
			@IsApproved,
			@CreatedOn,
			@CreatedBy,
			@IsDeleted
			)
END