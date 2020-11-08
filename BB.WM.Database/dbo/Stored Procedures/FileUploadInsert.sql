
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 11 Nov 2019
-- Description:	File Upload Insert
-- =============================================
CREATE PROCEDURE [dbo].[FileUploadInsert]
	@FileId				UNIQUEIDENTIFIER,
	@FileName			NVARCHAR(100),
	@FileTitle			NVARCHAR(100),
	@FileSize			FLOAT,
	@EntityType			INT,
	@EntityId			UNIQUEIDENTIFIER,
	@CreatedOn			DATETIME,
	@CreatedBy			UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [dbo].[FileUpload]
           (
			   [FileId],
			   [FileName],
			   [FileTitle],
			   [FileSize],
			   [EntityType],
			   [EntityId],
			   [CreatedOn],
			   [CreatedBy],
			   [IsDeleted]
		   )
     VALUES
           (
				@FileId,
				@FileName,
				@FileTitle,
				@FileSize,
				@EntityType,
				@EntityId,
				@CreatedOn,
				@CreatedBy,
				@IsDeleted
			)
END