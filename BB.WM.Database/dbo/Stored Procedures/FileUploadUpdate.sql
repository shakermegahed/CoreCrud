
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 11 Nov 2019
-- Description:	File Upload Update
-- =============================================
CREATE PROCEDURE [dbo].[FileUploadUpdate]
	@FileId				UNIQUEIDENTIFIER,
	@FileName			NVARCHAR(100),
	@FileTitle			NVARCHAR(100),
	@FileSize			FLOAT,
	@EntityType			INT,
	@EntityId			UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER

AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [dbo].[FileUpload]
	   SET 
			  [FileName]				= @FileName,
			  [FileSize]				= @FileSize,
			  [FileTitle]				= @FileTitle,				
			  [EntityType]				= @EntityType,
			  [EntityId]				= @EntityId,
			  [LastModifiedOn]			= @LastModifiedOn,
			  [LastModifiedBy]			= @LastModifiedBy
	WHERE 
		[FileId]						= @FileId
END