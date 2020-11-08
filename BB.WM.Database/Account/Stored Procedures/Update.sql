-- =============================================
-- Author:		Peter Sobhy 
-- Create date: 30 Mar 2019
-- Description:	update administrator
-- =============================================
CREATE PROCEDURE [Account].[Update]
	@AccountId	UNIQUEIDENTIFIER,
	@Email				NVARCHAR(100),
	@NormalizedEmail	NVARCHAR(255),
	@UserName			NVARCHAR(255),
	@NormalizedUserName NVARCHAR(255),
	@EmailConfirmed		BIT, 
	@PasswordHash		NVARCHAR(max),
	@FirstName			NVARCHAR(100),
	@LastName			NVARCHAR(100),
	@Status				INT,
	@LastModifiedOn		DATETIME,
	@IsDeleted			BIT,
	@SecurityStamp		NVARCHAR(255),
	@LockoutEndDateUtc	DATETIME,
	@LockoutEnabled		BIT,
	@AccessFailedCount	INT
	
AS
BEGIN
	
	UPDATE [Account].[Account] 
	SET
		Email					= @Email,
		NormalizedEmail			= @NormalizedEmail,
		UserName				= @UserName,
		NormalizedUserName		= @NormalizedUserName,
		EmailConfirmed			= @EmailConfirmed,
		PasswordHash			= @PasswordHash,
		FirstName				= @FirstName,
		LastName				= @LastName,
		Status					= @Status,
		LastModifiedOn			= @LastModifiedOn,	
		IsDeleted				= @IsDeleted,  
		SecurityStamp			= @SecurityStamp,
		LockoutEndDateUtc		= @LockoutEndDateUtc,
		LockoutEnabled			= @LockoutEnabled,
		AccessFailedCount		= @AccessFailedCount
	WHERE
		AccountId			= @AccountId

END