
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Brand Get By Id
-- =============================================
CREATE PROCEDURE [Website].[BrandGetById] 
	@BrandId		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Brand]
	WHERE 
		BrandId = @BrandId
END