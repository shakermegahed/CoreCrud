CREATE TABLE [dbo].[Hotel] (
    [HotelId]        UNIQUEIDENTIFIER NOT NULL,
    [Name]           NVARCHAR (100)   NULL,
    [DestinationId]  UNIQUEIDENTIFIER NULL,
    [IsApproved]     BIT              NULL,
    [CreatedOn]      DATETIME         NOT NULL,
    [CreatedBy]      UNIQUEIDENTIFIER NULL,
    [LastModifiedOn] DATETIME         NULL,
    [LastModifiedBy] UNIQUEIDENTIFIER NULL,
    [IsDeleted]      BIT              NULL,
    CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED ([HotelId] ASC),
    CONSTRAINT [FK_Hotel_Destination] FOREIGN KEY ([DestinationId]) REFERENCES [dbo].[Destination] ([DestinationId]) ON DELETE CASCADE
);













