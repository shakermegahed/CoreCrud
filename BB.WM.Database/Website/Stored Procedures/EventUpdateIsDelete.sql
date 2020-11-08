
-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 5 Nov 2019
-- Description:	Event Update IsDelete
-- =============================================
CREATE PROCEDURE [Website].[EventUpdateIsDelete] 
	@EventId			 UNIQUEIDENTIFIER,
	@LastModifiedOn		 DATETIME,
	@LastModifiedBy		 UNIQUEIDENTIFIER,
	@IsDeleted			 BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[Event]
	 SET 
       [LastModifiedOn]		 = @LastModifiedOn,
       [LastModifiedBy]		 = @LastModifiedBy,
	   [IsDeleted]			 = @IsDeleted

 WHERE 
	 [EventId] = @EventId
END