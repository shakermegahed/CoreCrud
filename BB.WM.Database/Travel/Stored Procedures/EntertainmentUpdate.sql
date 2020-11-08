
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 5 Nov 2019
-- Description:	Entertainment Update
-- =============================================
CREATE PROCEDURE [Travel].[EntertainmentUpdate] 
	@EntertainmentId		UNIQUEIDENTIFIER,
	@WebSiteDestinationId	UNIQUEIDENTIFIER,
	@Name					NVARCHAR(100),
	@Location				NVARCHAR(100),
	@Images					NVARCHAR(MAX),
	@Description			NVARCHAR(MAX),
	@LastModifiedOn			DATETIME,
	@LastModifiedBy			UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [Travel].[Entertainment]
	 SET 
		[EntertainmentId]			= @EntertainmentId,
		[WebSiteDestinationId]		= @WebSiteDestinationId,
		[Name]						= @Name,
		[Location]					= @Location,
		[Images]					= @Images,
		[Description]				= @Description,
		[LastModifiedBy]			= @LastModifiedBy,
		[LastModifiedOn]			= @LastModifiedOn

	WHERE 
			[EntertainmentId]	= @EntertainmentId
END