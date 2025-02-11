USE [BBWebMaster]
GO
/****** Object:  Table [dbo].[Destination]    Script Date: 3/5/2020 10:41:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destination](
	[DestinationId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Destination] PRIMARY KEY CLUSTERED 
(
	[DestinationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Destination] ADD  CONSTRAINT [DF_City_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[CountryInsert]    Script Date: 3/5/2020 10:41:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 25 Sept 2019
-- Description:	Country Insert
-- =============================================
CREATE PROCEDURE [dbo].[CountryInsert] 
	@CountryId			UNIQUEIDENTIFIER,
	@Name				NVARCHAR(50),
	@Flag				NVARCHAR(50),
	@CreatedOn			DATETIME,
	@CreatedBy			UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

   INSERT INTO [dbo].[Country]
           ( 
		   [CountryId],
		   [Name],
		   [Flag],
		   [CreatedOn],
		   [CreatedBy],
		   [IsDeleted]
		   )
     VALUES
           (
			@CountryId,
			@Name,
			@Flag,
			@CreatedOn,
			@CreatedBy,
			@IsDeleted
			)
END
GO
/****** Object:  StoredProcedure [dbo].[CountryUpdateIsDelete]    Script Date: 3/5/2020 10:41:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ahmed Dessouki
-- Create date: 1 Oct 2019
-- Description:	Country Update IsDeleted
-- =============================================
Create PROCEDURE [dbo].[CountryUpdateIsDelete] 
	@CountryId			UNIQUEIDENTIFIER,
	@LastModifiedOn		DATETIME,
	@LastModifiedBy		UNIQUEIDENTIFIER,
	@IsDeleted			BIT
AS
BEGIN
	
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

	UPDATE [dbo].[Country]
	SET 
		[LastModifiedBy]	= @LastModifiedBy,
		[LastModifiedOn]	= @LastModifiedOn,
		[IsDeleted]			= @IsDeleted

	WHERE
		[CountryId] = @CountryId
END
GO
/****** Object:  StoredProcedure [dbo].[DestinationGetAll]    Script Date: 3/5/2020 10:41:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Shaker Mohamed
-- Create date: 29 Nov 2019
-- Description:	City Get All
-- =============================================
CREATE PROCEDURE [dbo].[DestinationGetAll]

AS
BEGIN
		SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		SET NOCOUNT ON;

		SELECT destination.*
		FROM [dbo].[Destination] destination 
		where IsDeleted=0
		
		
		

END
GO
