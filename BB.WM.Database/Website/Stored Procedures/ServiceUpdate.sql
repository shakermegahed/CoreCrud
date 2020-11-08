
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 23 Oct 2019
-- Description:	Service Update
-- =============================================
CREATE PROCEDURE [Website].[ServiceUpdate] 
	@ServiceId		UNIQUEIDENTIFIER,
	@parentId		UNIQUEIDENTIFIER,
	@Title			NVARCHAR(150),
	@ImageFile		NVARCHAR(50),
	@ServiceOrder	INT,
	@Description	NVARCHAR(MAX),
	@ServiceLevel	INT,
	@LastModifiedOn DATETIME,
	@LastModifiedBy UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Website].[Service]
	SET 
       [parentId]			= @parentId,
       [Title]				= @Title,
       [ImageFile]			= @ImageFile,
       [Description]		= @Description,
	   [ServiceLevel]		= @ServiceLevel,
	   [ServiceOrder]		= @ServiceOrder,
	   [LastModifiedOn]		= @LastModifiedOn,
	   [LastModifiedBy]		= @LastModifiedBy
	WHERE 
		[ServiceId]			= @ServiceId
END