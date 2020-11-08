
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Event Get By Id
-- =============================================
CREATE PROCEDURE [Website].[ProjectGetById] 
	@ProjectId		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Project]
	WHERE 
		ProjectId = @ProjectId
END