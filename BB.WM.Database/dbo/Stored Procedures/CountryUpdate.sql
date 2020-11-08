
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 25 Sept 2019
-- Description:	Country Update
-- =============================================
CREATE PROCEDURE [dbo].[CountryUpdate] 
	@CountryId			 UNIQUEIDENTIFIER,
	@Name				 NVARCHAR(50),
	@Flag				 NVARCHAR(50),
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [dbo].[Country] 
	 SET 
       [Name]				 = @Name,
	   [Flag]				 = @Flag,
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy

 WHERE 
	 [CountryId] = @CountryId
END