-- =============================================
-- Author:		Peter Sobhy 
-- Create date: 30 Mar 2019
-- Description:	Update administrator PasswordHash
-- =============================================
CREATE PROCEDURE [Account].[UpdatePasswordHashed]
@AccountId			UNIQUEIDENTIFIER,
@PasswordHash		NVARCHAR(MAX),
@LastModifiedOn		DATETIME
	
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

UPDATE [Account].[Account] 
SET
	PasswordHash	= @PasswordHash,	
	LastModifiedOn	= @LastModifiedOn			    
WHERE
	AccountId = @AccountId

END