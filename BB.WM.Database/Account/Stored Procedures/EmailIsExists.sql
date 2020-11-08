-- =============================================
-- Author:		Peter Sobhy
-- Create date: 30 Mar 2019
-- Description:	Validate Administrator Email
-- =============================================
CREATE PROCEDURE [Account].[EmailIsExists]
	@Email				nvarchar(255)
AS
BEGIN

	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT 
		COUNT(*)
	FROM 
		[Account].[Account]	
	WHERE 		
		Email = @Email 
END