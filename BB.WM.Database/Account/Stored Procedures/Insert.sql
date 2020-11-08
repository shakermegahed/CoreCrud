-- =============================================
-- Author:		Peter Sobhy 
-- Create date: 30 Mar 2019
-- Description:	Insert new account administrator
-- =============================================
CREATE PROCEDURE [Account].[Insert]
	@AccountId			UNIQUEIDENTIFIER,
	@Email				NVARCHAR(100),
	@NormalizedEmail	NVARCHAR(255),
	@UserName			NVARCHAR(255),
	@NormalizedUserName NVARCHAR(255),
	@EmailConfirmed		BIT, 
	@PasswordHash		NVARCHAR(max),
	@FirstName			NVARCHAR(100),
	@LastName			NVARCHAR(100),
	@Status				INT,
	@CreatedOn			DATETIME,
	@CreatedBy			UNIQUEIDENTIFIER,
	@IsDeleted			BIT,
	@SecurityStamp		NVARCHAR(255),
	@LockoutEndDateUtc	DATETIME,
	@LockoutEnabled		BIT,
	@AccessFailedCount	INT	
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [Account].[Account] (
		AccountId,
		Email,
		NormalizedEmail,
		UserName,
		NormalizedUserName,
		EmailConfirmed, 
		PasswordHash,
		FirstName,
		LastName,
		Status,
		CreatedOn,
		CreatedBy,
		IsDeleted,
		SecurityStamp,
		LockoutEndDateUtc,
		LockoutEnabled,
		AccessFailedCount
	) VALUES (
		@AccountId,
		@Email,
		@NormalizedEmail,
		@UserName,
		@NormalizedUserName,
		@EmailConfirmed, 
		@PasswordHash,
		@FirstName,
		@LastName,
		@Status,
		@CreatedOn,
		@CreatedBy,
		@IsDeleted,
		@SecurityStamp,
		@LockoutEndDateUtc,
		@LockoutEnabled,
		@AccessFailedCount
	)

END