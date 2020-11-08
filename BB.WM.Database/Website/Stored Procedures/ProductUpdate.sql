-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Website Product Update
-- =============================================
CREATE PROCEDURE [Website].[ProductUpdate]
	@ProductId			UNIQUEIDENTIFIER,
	@ProductTitle		NVARCHAR(100),
	@Images				NVARCHAR(MAX),
	@Description		NVARCHAR(max),
	@CategoryId			UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER

AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

		UPDATE [Website].[Product]
		   SET 
			  [ProductTitle]	= @ProductTitle,
			  [Images]			= @Images,
			  [Description]		= @Description,
			  [CategoryId]		= @CategoryId,
			  [LastModifiedOn]	= @LastModifiedOn,
			  [LastModifiedBy]	= @LastModifiedBy
		WHERE 
			[ProductId]			= @ProductId
END