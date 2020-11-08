
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 3 Oct 2019
-- Description:	Feature get By Id
-- =============================================
Create PROCEDURE [Auth].[FeatureGetById] 
	@FeatureId			UNIQUEIDENTIFIER

AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT *
	FROM	[Auth].[Feature]

	WHERE FeatureId = @FeatureId

END