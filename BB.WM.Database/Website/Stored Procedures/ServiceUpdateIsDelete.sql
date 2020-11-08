
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 23 Oct 2019
-- Description:	Service Update IsDelete
-- =============================================
Create PROCEDURE [Website].[ServiceUpdateIsDelete] 
	@ServiceId			 UNIQUEIDENTIFIER,
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER,
	@IsDeleted			 BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[Service]
	 SET 
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy,
	   [IsDeleted]			 = @IsDeleted

 WHERE 
	 [ServiceId] = @ServiceId
END