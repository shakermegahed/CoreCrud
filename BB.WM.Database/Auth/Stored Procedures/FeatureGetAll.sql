
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 1 Oct 2019
-- Description:	Feature get all
-- =============================================
CREATE PROCEDURE [Auth].[FeatureGetAll] 

AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT *
	FROM	[Auth].[Feature]

END