-- =============================================
-- Author:		Peter Sobhy 
-- Create date: 30 Mar 2019
-- Description:	Insert new account administrator
-- =============================================
CREATE PROCEDURE [Account].[GetById]
	@AccountId UNIQUEIDENTIFIER
	
AS
BEGIN

	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	SELECT * 
	FROM
		[Account].[Account] 
	WHERE
		AccountId = @AccountId

END