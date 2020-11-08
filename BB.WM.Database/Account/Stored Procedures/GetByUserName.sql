-- =============================================
-- Author:		Peter Sobhy
-- Create date: 20 Apr 2018
-- Description:	Account - Get Administrator by UserName
-- =============================================
CREATE PROCEDURE [Account].[GetByUserName]
	@UserName	nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT *
	FROM [Account].[Account]		
	WHERE NormalizedUserName = @UserName
END