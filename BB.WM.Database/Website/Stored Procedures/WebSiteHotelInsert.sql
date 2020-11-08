
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 26 Oct 2019
-- Description:	WebSite Hotel Insert
-- =============================================
CREATE PROCEDURE [Website].[WebSiteHotelInsert] 
	@WebSiteHotelId		UNIQUEIDENTIFIER,
	@WebSiteId			UNIQUEIDENTIFIER,
	@HotelId			UNIQUEIDENTIFIER,
	@ParentId			UNIQUEIDENTIFIER,
	@HotelImages		NVARCHAR(MAX),
	@Description		NVARCHAR(MAX),
	@MapURL				NVARCHAR(150),
	@HotelLogo			NVARCHAR(100),
	@Stars				FLOAT,
	@WebsiteLink		NVARCHAR(250),
	@CreatedOn			DATETIME,
	@CreatedBy			UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [Website].[WebSiteHotel]
           (
			[WebSiteHotelId],
			[WebSiteId],
			[HotelId],
			[ParentId],
			[HotelImages],
			[Description],
			[MapURL],
			[HotelLogo],
			[Stars],
			[WebsiteLink],
			[CreatedOn],
			[CreatedBy],
			[IsDeleted]
		   )
     VALUES
           (
		   @WebSiteHotelId,
           @WebSiteId,
           @HotelId,
		   @ParentId,
           @HotelImages,
		   @Description,
		   @MapURL,
		   @HotelLogo,
		   @Stars,
		   @WebsiteLink,
           @CreatedOn,
           @CreatedBy,
           @IsDeleted
		   )
END