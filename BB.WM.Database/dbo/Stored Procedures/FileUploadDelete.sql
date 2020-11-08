
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 11 Nov 2019
-- Description:	File Upload Delete
-- =============================================
CREATE PROCEDURE [dbo].[FileUploadDelete]
	@FileId				UNIQUEIDENTIFIER

AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	DELETE FROM [dbo].[FileUpload]
		   WHERE 
				[FileId]						= @FileId
END