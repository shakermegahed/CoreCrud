
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Oct 2019
-- Description:	WebSite Restaurant Insert
-- =============================================
CREATE PROCEDURE [Website].[WebSiteRestaurantInsert] 
	@WebSiteRestaurantId		UNIQUEIDENTIFIER,
	@WebSiteId					UNIQUEIDENTIFIER,
	@RestaurantId				UNIQUEIDENTIFIER,
	@ParentId					UNIQUEIDENTIFIER,
	@RestaurantImages			NVARCHAR(MAX),
	@PriceRange					NVARCHAR(50),
	@RestaurantLogo				NVARCHAR(100),
	@Rate						FLOAT,
	@WebsiteLink				NVARCHAR(200),
	@Description				NVARCHAR(MAX),
	@CreatedOn					DATETIME,
	@CreatedBy					UNIQUEIDENTIFIER,
	@IsDeleted					BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [Website].[WebSiteRestaurant]
           (
			[WebSiteRestaurantId],
			[WebSiteId],
			[RestaurantId],
			[RestaurantImages],
			[PriceRange],
			[RestaurantLogo],
			[ParentId],
			[Rate],
			[WebsiteLink],
			[Description],
			[CreatedOn],
			[CreatedBy],
			[IsDeleted]
		   )
     VALUES
           (
		   @WebSiteRestaurantId,
           @WebSiteId,
           @RestaurantId, 
           @RestaurantImages,
		   @PriceRange,
		   @RestaurantLogo,
		   @ParentId,
		   @Rate,
		   @WebsiteLink,
		   @Description,
           @CreatedOn,
           @CreatedBy,
           @IsDeleted
		   )
END