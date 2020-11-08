
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 23 Oct 2019
-- Description:	Service Get All
-- =============================================
Create PROCEDURE [Website].[ServiceGetById] 
	@ServiceId		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SET NOCOUNT ON;
	SELECT * 
	FROM [Website].[Service]
	WHERE 
		ServiceId = @ServiceId
END