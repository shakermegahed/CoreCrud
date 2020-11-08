
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Event Get By Id
-- =============================================
CREATE PROCEDURE [Website].[EventGetById] 
	@EventId		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Event]
	WHERE 
		EventId = @EventId
END