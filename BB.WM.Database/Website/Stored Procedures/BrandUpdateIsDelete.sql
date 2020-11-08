
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Brand Update IsDelete
-- =============================================
CREATE PROCEDURE [Website].[BrandUpdateIsDelete] 
	@BrandId			 UNIQUEIDENTIFIER,
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER,
	@IsDeleted			 BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[Brand]
	 SET 
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy,
	   [IsDeleted]			 = @IsDeleted

 WHERE 
	 [BrandId] = @BrandId
END