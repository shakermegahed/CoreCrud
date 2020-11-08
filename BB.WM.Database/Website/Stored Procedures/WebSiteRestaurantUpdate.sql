
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Oct 2019
-- Description:	WebSite Restaurant Update
-- =============================================
CREATE PROCEDURE [Website].[WebSiteRestaurantUpdate] 
	@WebSiteRestaurantId	UNIQUEIDENTIFIER,
	@RestaurantId			UNIQUEIDENTIFIER,
	@ParentId				UNIQUEIDENTIFIER,
	@RestaurantImages		NVARCHAR(MAX),
	@PriceRange				NVARCHAR(50),
	@RestaurantLogo			NVARCHAR(100),
	@Rate					FLOAT,
	@WebsiteLink			NVARCHAR(200),
	@Description			NVARCHAR(MAX),
	@LastModifiedOn			DATETIME,
	@LastModifiedBy			UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	
	UPDATE [Website].[WebSiteRestaurant]
		SET 
			[RestaurantId]		= @RestaurantId,
			[ParentId]			= @ParentId,
			[RestaurantImages]	= @RestaurantImages,
			[PriceRange]		= @PriceRange,
			[RestaurantLogo]	= @RestaurantLogo,
			[Rate]				= @Rate,
			[Description]		= @Description,
			[WebsiteLink]		= @WebsiteLink,
			[LastModifiedOn]	= @LastModifiedOn,
			[LastModifiedBy]	= @LastModifiedBy
	WHERE 
		[WebSiteRestaurantId]	= @WebSiteRestaurantId
END