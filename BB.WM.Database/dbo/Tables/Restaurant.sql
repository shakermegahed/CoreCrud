CREATE TABLE [dbo].[Restaurant] (
    [RestaurantId]   UNIQUEIDENTIFIER NOT NULL,
    [Name]           NVARCHAR (100)   NULL,
    [DestinationId]  UNIQUEIDENTIFIER NULL,
    [IsApproved]     BIT              NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              NULL,
    CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED ([RestaurantId] ASC),
    CONSTRAINT [FK_Restaurant_Destination] FOREIGN KEY ([DestinationId]) REFERENCES [dbo].[Destination] ([DestinationId]) ON DELETE CASCADE
);













