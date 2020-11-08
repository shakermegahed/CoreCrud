
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Destination UpdateIsDelete
-- =============================================
CREATE PROCEDURE [dbo].[DestinationUpdateIsDelete]
	@DestinationId				UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		
		UPDATE [dbo].[Destination]
		   SET 
			  [LastModifiedOn]	= @LastModifiedOn,
			  [LastModifiedBy]	= @LastModifiedBy,
			  [IsDeleted]		= @IsDeleted
			  
		WHERE 
				[DestinationId]		= @DestinationId
END