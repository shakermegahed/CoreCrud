
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 1 Oct 2019
-- Description:	Feature Insert
-- =============================================
CREATE PROCEDURE [Auth].[FeatureInsert] 
	@FeatureId			UNIQUEIDENTIFIER,
	@Code				NVARCHAR(50),
	@Name				NVARCHAR(100),
	@Description		NVARCHAR(1000),
	@Status				INT,
	@CreatedOn			DATETIME,
	@CreatedBy			UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

   INSERT INTO [Auth].[Feature]
           (
			[FeatureId],
			[Code],
			[Name],
			[Description],
			[Status],
			[CreatedBy],
			[CreatedOn],
			[IsDeleted]
		   )
     VALUES
           (
			@FeatureId,
			@Code,
			@Name,
			@Description,
			@Status,
			@CreatedBy,
			@CreatedOn,
			@IsDeleted
			)
END