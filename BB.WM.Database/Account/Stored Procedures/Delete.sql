-- =============================================
-- Author:		Peter Sobhy 
-- Create date: 30 Mar 2019
-- Description:	Delete Account Admin 
-- =============================================
CREATE PROCEDURE [Account].[Delete]
@AccountId		uniqueidentifier
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	DELETE FROM 
		[Account].[Account]
	WHERE 
		AccountId = @AccountId
END