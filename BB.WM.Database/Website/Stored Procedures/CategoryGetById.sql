
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Category Get By Id
-- =============================================
CREATE PROCEDURE [Website].[CategoryGetById] 
	@CategoryId		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Category]
	WHERE 
		CategoryId = @CategoryId
END