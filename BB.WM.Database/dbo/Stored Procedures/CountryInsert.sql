
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 25 Sept 2019
-- Description:	Country Insert
-- =============================================
CREATE PROCEDURE [dbo].[CountryInsert] 
	@CountryId			UNIQUEIDENTIFIER,
	@Name				NVARCHAR(50),
	@Flag				NVARCHAR(50),
	@CreatedOn			DATETIME,
	@CreatedBy			UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

   INSERT INTO [dbo].[Country]
           ( 
		   [CountryId],
		   [Name],
		   [Flag],
		   [CreatedOn],
		   [CreatedBy],
		   [IsDeleted]
		   )
     VALUES
           (
			@CountryId,
			@Name,
			@Flag,
			@CreatedOn,
			@CreatedBy,
			@IsDeleted
			)
END