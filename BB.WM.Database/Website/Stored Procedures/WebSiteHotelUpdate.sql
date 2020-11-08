
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Oct 2019
-- Description:	WebSite Hotel Update
-- =============================================
CREATE PROCEDURE [Website].[WebSiteHotelUpdate] 
	@WebSiteHotelId		UNIQUEIDENTIFIER,
	@HotelId			UNIQUEIDENTIFIER,
	@ParentId			UNIQUEIDENTIFIER,
	@HotelImages		NVARCHAR(MAX),
	@Description		NVARCHAR(MAX),
	@MapURL				NVARCHAR(150),
	@HotelLogo			NVARCHAR(100),
	@Stars				FLOAT,
	@WebsiteLink		NVARCHAR(250),
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	
	UPDATE [Website].[WebSiteHotel]
		SET 
			[HotelId]			= @HotelId,
			[HotelImages]		= @HotelImages,
			[Description]		= @Description,
			[MapURL]			= @MapURL,
			[ParentId]			= @ParentId,
			[HotelLogo]			= @HotelLogo,
			[Stars]				= @Stars,
			[WebsiteLink]		= @WebsiteLink,
			[LastModifiedOn]	= @LastModifiedOn,
			[LastModifiedBy]	= @LastModifiedBy
	WHERE 
		[WebSiteHotelId]		= @WebSiteHotelId
END