
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 12 Nov 2019
-- Description:	File Upload Get By Id
-- =============================================
CREATE PROCEDURE [dbo].[FileUploadGetById]
	@FileId		UNIQUEIDENTIFIER


AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT * 
	FROM [dbo].[FileUpload]
	WHERE
		FileId  = @FileId
END