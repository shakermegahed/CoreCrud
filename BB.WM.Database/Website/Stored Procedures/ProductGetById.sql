-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Website Product Get By Id
-- =============================================
CREATE PROCEDURE [Website].[ProductGetById]
	@ProductId			UNIQUEIDENTIFIER

AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

		SELECT product.* ,category.Title AS CategoryTitle 
		FROM [Website].[Product] product
		INNER JOIN [Website].[Category] category ON product.CategoryId = category.CategoryId
		WHERE
			product.ProductId = @ProductId
END