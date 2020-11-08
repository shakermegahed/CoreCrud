
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Restaurant Update
-- =============================================
CREATE PROCEDURE [dbo].[RestaurantUpdate]
	@RestaurantId			UNIQUEIDENTIFIER,
	@Name			NVARCHAR(100),
	@DestinationId					UNIQUEIDENTIFIER,
	@IsApproved				BIT,
	@LastModifiedOn			DATETIME,
	@LastModifiedBy			UNIQUEIDENTIFIER
AS
BEGIN

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		UPDATE [dbo].[Restaurant]
		   SET 
				[Name]						= @Name,
				[DestinationId]				= @DestinationId,
				[IsApproved]				= @IsApproved,
				[LastModifiedOn]			= @LastModifiedOn,
				[LastModifiedBy]			= @LastModifiedBy
		WHERE 
			[RestaurantId]					= @RestaurantId	
END