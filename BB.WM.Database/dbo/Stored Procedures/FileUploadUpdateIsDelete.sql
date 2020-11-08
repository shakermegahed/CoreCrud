
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 11 Nov 2019
-- Description:	File Upload Update IsDelete
-- =============================================
CREATE PROCEDURE [dbo].[FileUploadUpdateIsDelete]
	@FileId				UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT


AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [dbo].[FileUpload]
	   SET 
			  [LastModifiedOn]			= @LastModifiedOn,
			  [LastModifiedBy]			= @LastModifiedBy,
			  [IsDeleted]				= @IsDeleted
	WHERE 
		[FileId]						= @FileId
END