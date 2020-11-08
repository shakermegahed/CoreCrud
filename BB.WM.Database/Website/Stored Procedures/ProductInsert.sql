-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Website Product Insert
-- =============================================
CREATE PROCEDURE [Website].[ProductInsert]
	@ProductId			UNIQUEIDENTIFIER,
	@ProductTitle		NVARCHAR(100),
	@Images				NVARCHAR(MAX),
	@Description		NVARCHAR(MAX),
	@CategoryId			UNIQUEIDENTIFIER,
	@CreatedOn			DATETIME,
	@CreatedBy			UNIQUEIDENTIFIER,
	@IsDeleted			BIT

AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

		INSERT INTO [Website].[Product]
           (
			   [ProductId],
			   [ProductTitle],
			   [Images],
			   [Description],
			   [CategoryId],
			   [CreatedOn],
			   [CreatedBy],
			   [IsDeleted]
		   )
     VALUES
           (
				@ProductId,
				@ProductTitle,
				@Images,
				@Description,
				@CategoryId,
				@CreatedOn,
				@CreatedBy,
				@IsDeleted
			)
END