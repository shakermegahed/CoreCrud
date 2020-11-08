
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 9 Oct 2019
-- Description:	Form Get By Id
-- =============================================
CREATE PROCEDURE [dbo].[FormGetById]
@FormId		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[Form] form

	WHERE form.FormId = @FormId
END