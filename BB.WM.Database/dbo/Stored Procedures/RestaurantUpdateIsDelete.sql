
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Restaurant Update IsDelete
-- =============================================
CREATE PROCEDURE [dbo].[RestaurantUpdateIsDelete]
	@RestaurantId			UNIQUEIDENTIFIER,
	@LastModifiedOn			DATETIME,
	@LastModifiedBy			UNIQUEIDENTIFIER,
	@IsDeleted				BIT
AS
BEGIN

		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		UPDATE [dbo].[Restaurant]
		   SET 
			  [LastModifiedOn]		= @LastModifiedOn,
			  [LastModifiedBy]		= @LastModifiedBy,
			  [IsDeleted]			= @IsDeleted
		WHERE 
			[RestaurantId]			= @RestaurantId	
END