-- =============================================
-- Author:		Peter Sobhy
-- Create date: 19 Apr 2019
-- Description:	Administrator - Get By Email
-- =============================================
CREATE PROCEDURE [Account].[GetByEmail]
	@Email	nvarchar(255),
	@TodayDate		DATETIME
AS
BEGIN
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	DECLARE @AccountId UNIQUEIDENTIFIER
	SELECT @AccountId = [Account].[Account].[AccountId] FROM [Account].[Account]
	-- [1] Administrator
	SELECT account.*,Role.RoleName FROM  [Account].[Account] account
	INNER JOIN [Auth].[AccountRole] accountRole ON account.AccountId = accountRole.AccountId
	INNER JOIN [Auth].[Role] ON accountRole.RoleId = Role.RoleId
	WHERE account.Email = @Email

END