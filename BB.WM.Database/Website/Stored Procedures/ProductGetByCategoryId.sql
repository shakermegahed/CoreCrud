-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Website Product Get By Category Id
-- =============================================
CREATE PROCEDURE [Website].[ProductGetByCategoryId]
	@CategoryId			UNIQUEIDENTIFIER,
	@IsDeleted			BIT

AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		SET NOCOUNT ON;
		SELECT product.* ,category.Title AS CategoryTitle 
		FROM [Website].[Product] product
		INNER JOIN [Website].[Category] category ON product.CategoryId = category.CategoryId
		WHERE
			product.CategoryId = @CategoryId
		AND (product.IsDeleted  = @IsDeleted OR @IsDeleted IS NULL)
END