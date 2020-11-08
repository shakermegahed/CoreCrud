
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Restaurant Insert
-- =============================================
CREATE PROCEDURE [dbo].[RestaurantInsert]
	@RestaurantId			UNIQUEIDENTIFIER,
	@Name			NVARCHAR(100),
	@DestinationId					UNIQUEIDENTIFIER,
	@IsApproved				BIT,
	@CreatedOn				DATETIME,
	@CreatedBy				UNIQUEIDENTIFIER,
	@IsDeleted				BIT
AS
BEGIN

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		INSERT INTO [dbo].[Restaurant]
			   (
				[RestaurantId],
				[Name],
				[DestinationId],
				[IsApproved],
				[CreatedOn],
				[CreatedBy],
				[IsDeleted]
			   )
		VALUES
			   (
				@RestaurantId,
				@Name,
				@DestinationId,
				@IsApproved,
				@CreatedOn,
				@CreatedBy,
				@IsDeleted
			   )	
END