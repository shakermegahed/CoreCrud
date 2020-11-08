
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Category Update IsDelete
-- =============================================
create PROCEDURE [Website].[CategoryUpdateIsDelete] 
	@CategoryId			 UNIQUEIDENTIFIER,
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER,
	@IsDeleted			 BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[Category]
	 SET 
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy,
	   [IsDeleted]			 = @IsDeleted

 WHERE 
	 [CategoryId] = @CategoryId
END