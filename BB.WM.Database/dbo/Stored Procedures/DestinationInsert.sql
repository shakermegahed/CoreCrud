
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Destination Insert
-- =============================================
CREATE PROCEDURE [dbo].[DestinationInsert]
	@DestinationId				UNIQUEIDENTIFIER,
	@CountryId			UNIQUEIDENTIFIER,
	@Name				NVARCHAR(50),
	@IsApproved			BIT,
	@CreatedOn			DATETIME,
	@CreatedBy			UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
			SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		
			INSERT INTO [dbo].[Destination]
					   (
					   [DestinationId],
					   [CountryId],
					   [Name],
					   [IsApproved],
					   [CreatedOn],
					   [CreatedBy],
					   [IsDeleted]
					   )
				 VALUES
					   (
					   @DestinationId,
					   @CountryId,
					   @Name,
					   @IsApproved,
					   @CreatedOn,
					   @CreatedBy,
					   @IsDeleted 
					   )		
END