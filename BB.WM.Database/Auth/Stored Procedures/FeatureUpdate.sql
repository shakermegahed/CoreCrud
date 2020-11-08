
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 1 Oct 2019
-- Description:	Feature Update
-- =============================================
CREATE PROCEDURE [Auth].[FeatureUpdate] 
	@FeatureId			UNIQUEIDENTIFIER,
	@Code				NVARCHAR(50),
	@Name				NVARCHAR(100),
	@Description		NVARCHAR(1000),
	@Status				INT,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Auth].[Feature]
	SET 
		[Code]				= @Code,
		[Name]				= @Name,
		[Description]		= @Description,
		[Status]			= @Status,
		[LastModifiedBy]	= @LastModifiedBy,
		[LastModifiedOn]	= @LastModifiedOn

	WHERE
		[FeatureId] = @FeatureId 
END