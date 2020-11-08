
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Brand Get All
-- =============================================
CREATE PROCEDURE [Website].[BrandGetAll] 
	@IsDeleted     BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Brand]
	WHERE IsDeleted = @IsDeleted
END