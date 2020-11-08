
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 1 Oct 2019
-- Description:	Feature Update IsDeleted
-- =============================================
create PROCEDURE [Auth].[FeatureUpdateIsDelete] 
	@FeatureId			UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Auth].[Feature]
	SET 
		[LastModifiedBy]	= @LastModifiedBy,
		[LastModifiedOn]	= @LastModifiedOn,
		[IsDeleted]			= @IsDeleted

	WHERE
		[FeatureId] = @FeatureId 
END