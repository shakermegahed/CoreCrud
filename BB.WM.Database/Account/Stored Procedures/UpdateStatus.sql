-- =============================================
-- Author:		Peter Sobhy 
-- Create date: 30 Mar 2019
-- Description:	Update administrator Status
-- =============================================
CREATE PROCEDURE [Account].[UpdateStatus]
@AccountId			UNIQUEIDENTIFIER,
@Status				INT,
@LastModifiedOn		DATETIME
	
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

UPDATE [Account].[Account] 
SET
	Status			= @Status,	
	LastModifiedOn	= @LastModifiedOn			    
WHERE
	AccountId = @AccountId

END