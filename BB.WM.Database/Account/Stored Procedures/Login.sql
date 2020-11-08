-- =============================================
-- Author:		Peter Sobhy 
-- Create date: 30 Mar 2019
-- Description:	Login administrator
-- =============================================
CREATE PROCEDURE [Account].[Login]
@Email				uniqueidentifier,
@PasswordHash		nvarchar(MAX)
AS
BEGIN

	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT 
	AccountId,
	Status,
	Email,
	FirstName,
	LastName,
	CreatedOn,
	CreatedBy,
	LastModifiedOn,
	LastModifiedBy,
	IsDeleted
FROM
	[Account].[Account]	
WHERE
	Email= @Email 
	AND PasswordHash = @PasswordHash
Order By
	FirstName, LastName

END