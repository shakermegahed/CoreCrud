
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 30 Nov 2019
-- Description:	Trip Insert
-- =============================================
CREATE PROCEDURE [Website].[TripInsert]
	@TripId			UNIQUEIDENTIFIER,
	@WebSiteId		UNIQUEIDENTIFIER,
	@TripTitle		NVARCHAR(150),
	@Duration		NVARCHAR(MAX),
	@Overview		NVARCHAR(MAX),
	@TripDestinations  NVARCHAR(MAX),
	@TripPlaces NVARCHAR(MAX),
	@Itinerary		NVARCHAR(MAX),
	@Price			DECIMAL(18,2),
	@Images			NVARCHAR(MAX),
	@PdfName		NVARCHAR(100),
	@CreatedOn		DATETIME,
	@CreatedBy		UNIQUEIDENTIFIER,
	@IsDeleted		BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	INSERT INTO [Website].[Trip]
           (
			[TripId],
			[WebSiteId],
			[TripTitle],
			[Duration],
			[Overview],
			[TripDestinations],
			[TripPlaces],
			[Itinerary],
			[Price],
			[Images],
			[PdfName],
			[CreatedOn],
			[CreatedBy],
			[IsDeleted]
			)
     VALUES
			(
				@TripId,
				@WebSiteId,
				@TripTitle,
				@Duration,
				@Overview,
				@TripDestinations,
				@TripPlaces,
				@Itinerary,
				@Price,
				@Images,
				@PdfName,
				@CreatedOn,
				@CreatedBy,
				@IsDeleted
			)
END