
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Country get By Id
-- =============================================
CREATE PROCEDURE [dbo].[CountryGetById] 
	@CountryId		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT *
	FROM	[dbo].[Country]
	WHERE CountryId = @CountryId

END