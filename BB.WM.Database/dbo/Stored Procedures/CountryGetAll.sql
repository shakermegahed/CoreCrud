
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 1 Oct 2019
-- Description:	Country get all
-- =============================================
CREATE PROCEDURE [dbo].[CountryGetAll] 
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT *
	FROM	[dbo].[Country]

END