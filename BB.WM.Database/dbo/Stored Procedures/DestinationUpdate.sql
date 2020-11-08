
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Oct 2019
-- Description:	Destination Update
-- =============================================
CREATE PROCEDURE [dbo].[DestinationUpdate]
	@DestinationId				UNIQUEIDENTIFIER,
	@CountryId			UNIQUEIDENTIFIER,
	@Name				NVARCHAR(50),
	@IsApproved			BIT,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER
AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		
		UPDATE [dbo].[Destination]
		   SET 
			  [CountryId]			= @CountryId,
			  [Name]				= @Name,
			  [IsApproved]			= @IsApproved,
			  [LastModifiedOn]		= @LastModifiedOn,
			  [LastModifiedBy]		= @LastModifiedBy
			  
		WHERE 
				[DestinationId]		= @DestinationId
END