
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 23 Oct 2019
-- Description:	Topic Update IsDelete
-- =============================================
CREATE PROCEDURE [Website].[TopicUpdateIsDelete] 
	@TopicId			 UNIQUEIDENTIFIER,
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER,
	@IsDeleted			 BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[Topic]
	 SET 
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy,
	   [IsDeleted]			 = @IsDeleted

 WHERE 
	 [TopicId] = @TopicId
END