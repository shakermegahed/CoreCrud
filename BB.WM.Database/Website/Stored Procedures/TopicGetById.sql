
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 23 Oct 2019
-- Description:	Topic Get By Id
-- =============================================
CREATE PROCEDURE [Website].[TopicGetById] 
	@TopicId		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Topic]
	WHERE 
		TopicId = @TopicId
END