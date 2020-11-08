-- =============================================
-- Author:		Peter Sobhy 
-- Create date: 30 Mar 2019
-- Description:	Update administrator IsDeleted
-- =============================================
CREATE PROCEDURE [Account].[UpdateIsDelete]
@AccountId			UNIQUEIDENTIFIER,
@IsDeleted			BIT,
@LastModifiedOn		DATETIME,
@LastModifiedBy	    UNIQUEIDENTIFIER
	
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

UPDATE [Account].[Account] 
SET
	IsDeleted		= @IsDeleted,	
	LastModifiedOn	= @LastModifiedOn,
	LastModifiedBy  = @LastModifiedBy			    
WHERE
	AccountId = @AccountId

END