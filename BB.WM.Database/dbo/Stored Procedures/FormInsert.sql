
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 9 Oct 2019
-- Description:	FormInsert
-- =============================================
CREATE PROCEDURE [dbo].[FormInsert]
@FormId				UNIQUEIDENTIFIER,
@WebSiteDomain		NVARCHAR(150),
@FormContent		NVARCHAR(MAX),
@FormType			NVARCHAR(150),
@CreationDate		DATETIME
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	INSERT INTO [dbo].[Form]
           (
		   [FormId],
           [WebSiteDomain],
           [FormType],
           [FormContent],
           [CreationDate]
		   )
     VALUES
           (
		   @FormId,
           @WebSiteDomain,
           @FormType,
           @FormContent,
           @CreationDate
		   )
END