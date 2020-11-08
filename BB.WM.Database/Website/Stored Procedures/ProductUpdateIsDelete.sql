-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Website Product Update Is Delete
-- =============================================
CREATE PROCEDURE [Website].[ProductUpdateIsDelete]
	@ProductId			UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT

AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

		UPDATE [Website].[Product]
		   SET 
			  [LastModifiedOn]	= @LastModifiedOn,
			  [LastModifiedBy]	= @LastModifiedBy,
			  [IsDeleted]		= @IsDeleted
		WHERE 
			[ProductId]			= @ProductId
END