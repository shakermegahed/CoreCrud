
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 1 Oct 2019
-- Description:	Country Update IsDeleted
-- =============================================
Create PROCEDURE [dbo].[CountryUpdateIsDelete] 
	@CountryId			UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [dbo].[Country]
	SET 
		[LastModifiedBy]	= @LastModifiedBy,
		[LastModifiedOn]	= @LastModifiedOn,
		[IsDeleted]			= @IsDeleted

	WHERE
		[CountryId] = @CountryId
END