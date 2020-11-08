
-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 1 Dec 2019
-- Description:	Trip update
-- =============================================
CREATE  PROCEDURE [Website].[TripUpdate]
	@TripId				UNIQUEIDENTIFIER,
	@TripTitle			NVARCHAR(150),
	@Duration			NVARCHAR(MAX),
	@Overview			NVARCHAR(MAX),
	@TripDestinations	NVARCHAR(MAX),
	@TripPlaces			NVARCHAR(MAX),
	@Itinerary			NVARCHAR(MAX),
	@Price				DECIMAL(18,2),
	@Images				NVARCHAR(MAX),
	@PdfName			NVARCHAR(100),
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	UPDATE [Website].[Trip]
	   SET 
			[TripTitle]				= @TripTitle,
			[Duration]				= @Duration,
			[OverView]				= @OverView,
			[TripDestinations]		= @TripDestinations,
			[TripPlaces]			= @TripPlaces,
			[Itinerary]				= @Itinerary,
			[Price]					= @Price,
			[Images]				= @Images,
			[PdfName]				= @PdfName,
			[LastModifiedOn]		= @LastModifiedOn,
			[LastModifiedBy]		= @LastModifiedBy
	WHERE
		[TripId] = @TripId
	
END